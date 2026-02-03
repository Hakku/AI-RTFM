<#
.SYNOPSIS
    Search documentation by tags, system, or action.

.DESCRIPTION
    Query the documentation library using tag-based filters.
    Uses the controlled vocabulary from standards/tag-taxonomy.md.

.PARAMETER Tag
    Filter by specific tag (can be used multiple times)

.PARAMETER System
    Filter by system tag (e.g., postgresql, kubernetes)

.PARAMETER Action
    Filter by action tag (e.g., deploy, troubleshoot)

.PARAMETER ListTags
    List all unique tags in use across documents

.PARAMETER Incomplete
    Find documents missing required tags

.PARAMETER Path
    Base path to search (default: script location parent)

.EXAMPLE
    .\search.ps1 -Tag postgresql
    Find all docs tagged with postgresql

.EXAMPLE
    .\search.ps1 -System kubernetes -Action deploy
    Find Kubernetes deployment docs

.EXAMPLE
    .\search.ps1 -ListTags
    Show all tags currently in use

.EXAMPLE
    .\search.ps1 -Incomplete
    Find docs missing required tags
#>

param(
    [string[]]$Tag,
    [string]$System,
    [string]$Action,
    [switch]$ListTags,
    [switch]$Incomplete,
    [string]$Path
)

# Set default path to parent of script location
if (-not $Path) {
    $Path = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
}

# Directories to search
$SearchDirs = @("runbooks", "incidents", "adr", "kb")

function Get-DocTags {
    param([string]$FilePath)

    $content = Get-Content $FilePath -Raw -ErrorAction SilentlyContinue
    if ($content -match 'tags:\s*\[([^\]]+)\]') {
        $tagString = $matches[1]
        $tags = $tagString -split ',' | ForEach-Object { $_.Trim() }
        return $tags
    }
    return @()
}

function Get-DocTitle {
    param([string]$FilePath)

    $content = Get-Content $FilePath -Raw -ErrorAction SilentlyContinue
    if ($content -match 'title:\s*(.+)') {
        return $matches[1].Trim()
    }
    # Fallback to filename
    return [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
}

function Get-AllDocs {
    $docs = @()
    foreach ($dir in $SearchDirs) {
        $fullPath = Join-Path $Path $dir
        if (Test-Path $fullPath) {
            $files = Get-ChildItem -Path $fullPath -Filter "*.md" -Recurse
            foreach ($file in $files) {
                $docs += [PSCustomObject]@{
                    Path = $file.FullName
                    RelativePath = $file.FullName.Replace($Path, "").TrimStart("\", "/")
                    Title = Get-DocTitle $file.FullName
                    Tags = Get-DocTags $file.FullName
                    Directory = $dir
                }
            }
        }
    }
    return $docs
}

# List all tags
if ($ListTags) {
    Write-Host "`nAll tags in use:`n" -ForegroundColor Cyan
    $allTags = @()
    $docs = Get-AllDocs
    foreach ($doc in $docs) {
        $allTags += $doc.Tags
    }
    $uniqueTags = $allTags | Sort-Object -Unique
    foreach ($t in $uniqueTags) {
        $count = ($allTags | Where-Object { $_ -eq $t }).Count
        Write-Host "  $t ($count)"
    }
    Write-Host "`nTotal: $($uniqueTags.Count) unique tags across $($docs.Count) documents`n"
    exit
}

# Find incomplete docs
if ($Incomplete) {
    Write-Host "`nDocuments missing required tags:`n" -ForegroundColor Yellow

    # Define required tag categories (at least one from each)
    $systemTags = @("postgresql", "mongodb", "redis", "kubernetes", "docker", "aws", "nginx", "vpn", "order-service", "user-service", "payment-service")
    $actionTags = @("deploy", "restart", "backup", "restore", "troubleshoot", "configure", "decision", "postmortem", "howto", "install", "setup")

    $docs = Get-AllDocs
    $incompleteDocs = @()

    foreach ($doc in $docs) {
        $hasSystem = $false
        $hasAction = $false

        foreach ($tag in $doc.Tags) {
            if ($systemTags -contains $tag) { $hasSystem = $true }
            if ($actionTags -contains $tag) { $hasAction = $true }
        }

        if (-not $hasSystem -or -not $hasAction) {
            $missing = @()
            if (-not $hasSystem) { $missing += "system" }
            if (-not $hasAction) { $missing += "action" }

            Write-Host "  $($doc.RelativePath)" -ForegroundColor Red
            Write-Host "    Missing: $($missing -join ', ')" -ForegroundColor DarkGray
            Write-Host "    Current tags: [$($doc.Tags -join ', ')]" -ForegroundColor DarkGray
            $incompleteDocs += $doc
        }
    }

    if ($incompleteDocs.Count -eq 0) {
        Write-Host "  All documents have required tags!" -ForegroundColor Green
    } else {
        Write-Host "`n$($incompleteDocs.Count) documents need attention.`n" -ForegroundColor Yellow
    }
    exit
}

# Search by tags
$docs = Get-AllDocs
$results = $docs

# Filter by Tag parameter
if ($Tag) {
    foreach ($t in $Tag) {
        $results = $results | Where-Object { $_.Tags -contains $t }
    }
}

# Filter by System
if ($System) {
    $results = $results | Where-Object { $_.Tags -contains $System }
}

# Filter by Action
if ($Action) {
    $results = $results | Where-Object { $_.Tags -contains $Action }
}

# Display results
if ($results.Count -eq 0) {
    Write-Host "`nNo documents found matching criteria.`n" -ForegroundColor Yellow
} else {
    Write-Host "`nFound $($results.Count) document(s):`n" -ForegroundColor Cyan
    foreach ($doc in $results) {
        Write-Host "  $($doc.RelativePath)" -ForegroundColor White
        Write-Host "    $($doc.Title)" -ForegroundColor Gray
        Write-Host "    [$($doc.Tags -join ', ')]" -ForegroundColor DarkGray
        Write-Host ""
    }
}
