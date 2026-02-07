<#
.SYNOPSIS
    Find documentation that needs review or has outdated timestamps.

.DESCRIPTION
    Identifies documents that:
    - Haven't been updated in N days (default: 30)
    - Are missing last_updated field
    - Have review_cycle that has passed

.PARAMETER Days
    Number of days after which a document is considered stale (default: 30)

.PARAMETER Path
    Base path to search (default: script location parent)

.PARAMETER Report
    Generate markdown report instead of console output

.EXAMPLE
    .\stale-finder.ps1
    Find docs not updated in 30+ days

.EXAMPLE
    .\stale-finder.ps1 -Days 90
    Find docs not updated in 90+ days

.EXAMPLE
    .\stale-finder.ps1 -Report
    Generate markdown report
#>

param(
    [int]$Days = 30,
    [string]$Path,
    [switch]$Report
)

# Set default path
if (-not $Path) {
    $Path = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
}

$SearchDirs = @(
    "runbooks", "incidents", "adr", "kb",
    "templates", "standards", "kernels",
    "api", "change", "onboard", "security",
    "compliance", "iac", "dr", "concept"
)
$Today = Get-Date
$CutoffDate = $Today.AddDays(-$Days)

function Get-DocMetadata {
    param([string]$FilePath)

    $content = Get-Content $FilePath -Raw -ErrorAction SilentlyContinue

    $metadata = @{
        Path = $FilePath
        RelativePath = $FilePath.Replace($Path, "").TrimStart("\", "/")
        Title = ""
        LastUpdated = $null
        ReviewCycle = $null
        Status = "unknown"
        Owner = ""
    }

    if ($content -match 'title:\s*(.+)') {
        $metadata.Title = $matches[1].Trim()
    }

    if ($content -match 'last_updated:\s*(\d{4}-\d{2}-\d{2})') {
        $metadata.LastUpdated = [DateTime]::Parse($matches[1])
    }

    if ($content -match 'review_cycle:\s*(\d+)_days') {
        $metadata.ReviewCycle = [int]$matches[1]
    }

    if ($content -match 'status:\s*(\w+)') {
        $metadata.Status = $matches[1].Trim()
    }

    if ($content -match 'owner:\s*(@?\w+)') {
        $metadata.Owner = $matches[1].Trim()
    }

    return $metadata
}

# Collect all docs
$allDocs = @()
foreach ($dir in $SearchDirs) {
    $fullPath = Join-Path $Path $dir
    if (Test-Path $fullPath) {
        $files = Get-ChildItem -Path $fullPath -Filter "*.md" -Recurse
        foreach ($file in $files) {
            $allDocs += Get-DocMetadata $file.FullName
        }
    }
}

# Categorize docs
$staleDocs = @()
$missingDate = @()
$reviewDue = @()

foreach ($doc in $allDocs) {
    # Skip non-active docs
    if ($doc.Status -eq "deprecated" -or $doc.Status -eq "archived") {
        continue
    }

    if ($null -eq $doc.LastUpdated) {
        $missingDate += $doc
    } elseif ($doc.LastUpdated -lt $CutoffDate) {
        $doc | Add-Member -NotePropertyName "DaysStale" -NotePropertyValue ([int]($Today - $doc.LastUpdated).TotalDays)
        $staleDocs += $doc
    }

    # Check review cycle
    if ($null -ne $doc.ReviewCycle -and $null -ne $doc.LastUpdated) {
        $reviewDate = $doc.LastUpdated.AddDays($doc.ReviewCycle)
        if ($reviewDate -lt $Today) {
            $doc | Add-Member -NotePropertyName "DaysOverdue" -NotePropertyValue ([int]($Today - $reviewDate).TotalDays) -Force
            $reviewDue += $doc
        }
    }
}

# Output
if ($Report) {
    # Markdown report
    $output = @"
# Documentation Freshness Report

**Generated:** $($Today.ToString("yyyy-MM-dd"))
**Threshold:** $Days days
**Documents scanned:** $($allDocs.Count)

## Summary

| Category | Count |
|----------|-------|
| Stale (>$Days days) | $($staleDocs.Count) |
| Missing date | $($missingDate.Count) |
| Review overdue | $($reviewDue.Count) |

## Stale Documents (>$Days days old)

"@

    if ($staleDocs.Count -eq 0) {
        $output += "None - all documents are fresh!`n"
    } else {
        $output += "| Document | Last Updated | Days Stale | Owner |`n"
        $output += "|----------|--------------|------------|-------|`n"
        foreach ($doc in ($staleDocs | Sort-Object DaysStale -Descending)) {
            $output += "| $($doc.RelativePath) | $($doc.LastUpdated.ToString("yyyy-MM-dd")) | $($doc.DaysStale) | $($doc.Owner) |`n"
        }
    }

    $output += "`n## Missing last_updated Field`n`n"

    if ($missingDate.Count -eq 0) {
        $output += "None - all documents have dates!`n"
    } else {
        foreach ($doc in $missingDate) {
            $output += "- $($doc.RelativePath)`n"
        }
    }

    $output += "`n## Review Cycle Overdue`n`n"

    if ($reviewDue.Count -eq 0) {
        $output += "None - all reviews are current!`n"
    } else {
        $output += "| Document | Review Cycle | Days Overdue |`n"
        $output += "|----------|--------------|--------------|`n"
        foreach ($doc in ($reviewDue | Sort-Object DaysOverdue -Descending)) {
            $output += "| $($doc.RelativePath) | $($doc.ReviewCycle) days | $($doc.DaysOverdue) |`n"
        }
    }

    Write-Output $output

} else {
    # Console output
    Write-Host "`n=== Documentation Freshness Report ===" -ForegroundColor Cyan
    Write-Host "Threshold: $Days days | Scanned: $($allDocs.Count) documents`n"

    # Stale docs
    Write-Host "STALE DOCUMENTS (>$Days days):" -ForegroundColor Yellow
    if ($staleDocs.Count -eq 0) {
        Write-Host "  None - all documents are fresh!" -ForegroundColor Green
    } else {
        foreach ($doc in ($staleDocs | Sort-Object DaysStale -Descending)) {
            Write-Host "  $($doc.RelativePath)" -ForegroundColor Red
            Write-Host "    Last updated: $($doc.LastUpdated.ToString("yyyy-MM-dd")) ($($doc.DaysStale) days ago)" -ForegroundColor DarkGray
        }
    }

    # Missing dates
    Write-Host "`nMISSING DATES:" -ForegroundColor Yellow
    if ($missingDate.Count -eq 0) {
        Write-Host "  None - all documents have dates!" -ForegroundColor Green
    } else {
        foreach ($doc in $missingDate) {
            Write-Host "  $($doc.RelativePath)" -ForegroundColor Red
        }
    }

    # Review overdue
    Write-Host "`nREVIEW OVERDUE:" -ForegroundColor Yellow
    if ($reviewDue.Count -eq 0) {
        Write-Host "  None - all reviews are current!" -ForegroundColor Green
    } else {
        foreach ($doc in ($reviewDue | Sort-Object DaysOverdue -Descending)) {
            Write-Host "  $($doc.RelativePath)" -ForegroundColor Red
            Write-Host "    $($doc.DaysOverdue) days overdue (cycle: $($doc.ReviewCycle) days)" -ForegroundColor DarkGray
        }
    }

    Write-Host "`n"
}
