---
type: api_documentation
kernel: api
title: [API Name and Endpoint]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
api_version: v1 | v2
review_cycle: 30_days
status: draft | published | deprecated
tags: [service-tag, api, protocol-tag]  # See standards/tag-taxonomy.md
# Required: 1+ service (order-service, user-service), protocol (rest, graphql)
# Recommended: authentication method, versioning
---

# [API Name] Documentation

**API Version:** v1 / v2  
**Base URL:** `https://api.example.com/v1`  
**Status:** Active / Beta / Deprecated

## Overview

[Brief description of what this API does and who should use it]

**Use Cases:**
- [Primary use case 1]
- [Primary use case 2]
- [Primary use case 3]

## Quick Start

### 1. Authentication
```bash
curl -X POST https://api.example.com/v1/auth \
  -H "Content-Type: application/json" \
  -d '{"api_key": "your_api_key_here"}'
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIs...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

### 2. Make Your First Request
```bash
curl -X GET https://api.example.com/v1/resource \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

## Authentication

### API Key

**How to get an API key:**
1. Log in to [Dashboard URL]
2. Navigate to Settings → API Keys
3. Click "Generate New Key"
4. Copy and store securely

**Using API Key:**
```bash
curl -X GET https://api.example.com/v1/endpoint \
  -H "X-API-Key: your_api_key"
```

### Bearer Token

**Token endpoint:** `POST /v1/auth/token`

**Request:**
```json
{
  "client_id": "your_client_id",
  "client_secret": "your_client_secret",
  "grant_type": "client_credentials"
}
```

**Response:**
```json
{
  "access_token": "eyJhbGci...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

**Using Bearer Token:**
```bash
curl -X GET https://api.example.com/v1/endpoint \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

## Endpoints

### GET /v1/[resource]

**Description:** [What this endpoint does]

**Authentication:** Required / Optional

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `id` | string | Yes | - | Resource identifier |
| `limit` | integer | No | 10 | Number of results (max: 100) |
| `offset` | integer | No | 0 | Pagination offset |
| `sort` | string | No | created_at | Sort field |
| `order` | string | No | desc | Sort order: asc or desc |

**Example Request:**
```bash
curl -X GET "https://api.example.com/v1/resource?limit=20&sort=name" \
  -H "Authorization: Bearer YOUR_TOKEN"
```

**Example Response (200 OK):**
```json
{
  "data": [
    {
      "id": "res_123456",
      "name": "Example Resource",
      "status": "active",
      "created_at": "2026-02-04T10:30:00Z",
      "updated_at": "2026-02-04T12:45:00Z"
    }
  ],
  "pagination": {
    "total": 150,
    "limit": 20,
    "offset": 0,
    "has_more": true
  }
}
```

**Error Responses:**

| Status Code | Description | Response |
|-------------|-------------|----------|
| 400 | Bad Request | `{"error": "Invalid parameter", "detail": "..."}` |
| 401 | Unauthorized | `{"error": "Invalid or expired token"}` |
| 403 | Forbidden | `{"error": "Insufficient permissions"}` |
| 404 | Not Found | `{"error": "Resource not found"}` |
| 429 | Rate Limited | `{"error": "Rate limit exceeded", "retry_after": 60}` |

---

### POST /v1/[resource]

**Description:** [What this endpoint does]

**Authentication:** Required

**Request Body:**
```json
{
  "name": "string (required, max 255 chars)",
  "description": "string (optional, max 1000 chars)",
  "status": "active | inactive (optional, default: active)",
  "metadata": {
    "key": "value"
  }
}
```

**Example Request:**
```bash
curl -X POST https://api.example.com/v1/resource \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "New Resource",
    "description": "Resource description",
    "status": "active"
  }'
```

**Example Response (201 Created):**
```json
{
  "id": "res_789012",
  "name": "New Resource",
  "description": "Resource description",
  "status": "active",
  "created_at": "2026-02-04T15:20:00Z"
}
```

**Validation Errors (422):**
```json
{
  "error": "Validation failed",
  "details": [
    {
      "field": "name",
      "message": "Name is required"
    }
  ]
}
```

---

### PUT /v1/[resource]/{id}

**Description:** Update existing resource

**Authentication:** Required

[Similar format to POST]

---

### DELETE /v1/[resource]/{id}

**Description:** Delete resource

**Authentication:** Required

**Example Request:**
```bash
curl -X DELETE https://api.example.com/v1/resource/res_123456 \
  -H "Authorization: Bearer YOUR_TOKEN"
```

**Example Response (204 No Content):**

[Empty response body]

## Rate Limiting

**Default Limits:**
- 1000 requests per hour per API key
- 100 requests per minute per IP address

**Headers:**
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 995
X-RateLimit-Reset: 1634567890
```

**When Rate Limited:**
```json
{
  "error": "Rate limit exceeded",
  "retry_after": 3600
}
```

## Pagination

All list endpoints support pagination:

**Parameters:**
- `limit`: Results per page (max: 100)
- `offset`: Number of results to skip

**Response includes:**
```json
{
  "data": [...],
  "pagination": {
    "total": 500,
    "limit": 20,
    "offset": 0,
    "has_more": true,
    "next_offset": 20
  }
}
```

## Error Handling

### Error Response Format
```json
{
  "error": "Error message",
  "error_code": "SPECIFIC_ERROR_CODE",
  "detail": "Detailed explanation",
  "request_id": "req_abc123"
}
```

### Common Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `INVALID_REQUEST` | 400 | Request format invalid |
| `UNAUTHORIZED` | 401 | Missing or invalid authentication |
| `FORBIDDEN` | 403 | Insufficient permissions |
| `NOT_FOUND` | 404 | Resource not found |
| `VALIDATION_ERROR` | 422 | Request validation failed |
| `RATE_LIMIT_EXCEEDED` | 429 | Too many requests |
| `INTERNAL_ERROR` | 500 | Server error |

### Retry Logic

**Recommended retry strategy:**
```python
import time
import requests

def api_call_with_retry(url, max_retries=3):
    for attempt in range(max_retries):
        try:
            response = requests.get(url)
            if response.status_code == 429:
                retry_after = int(response.headers.get('Retry-After', 60))
                time.sleep(retry_after)
                continue
            return response
        except requests.exceptions.RequestException:
            if attempt == max_retries - 1:
                raise
            time.sleep(2 ** attempt)
```

## Webhooks

### Subscribing to Events

**Endpoint:** `POST /v1/webhooks`
```json
{
  "url": "https://your-server.com/webhook",
  "events": ["resource.created", "resource.updated"],
  "secret": "your_webhook_secret"
}
```

### Webhook Payload
```json
{
  "id": "evt_123456",
  "type": "resource.created",
  "created_at": "2026-02-04T16:00:00Z",
  "data": {
    "id": "res_789012",
    "name": "New Resource"
  }
}
```

### Verifying Webhook Signatures
```python
import hmac
import hashlib

def verify_webhook(payload, signature, secret):
    expected = hmac.new(
        secret.encode(),
        payload.encode(),
        hashlib.sha256
    ).hexdigest()
    return hmac.compare_digest(signature, expected)
```

## Code Examples

### Python
```python
import requests

BASE_URL = "https://api.example.com/v1"
API_KEY = "your_api_key"

headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

# GET request
response = requests.get(f"{BASE_URL}/resource", headers=headers)
data = response.json()

# POST request
payload = {"name": "New Resource"}
response = requests.post(f"{BASE_URL}/resource", json=payload, headers=headers)
```

### JavaScript
```javascript
const BASE_URL = 'https://api.example.com/v1';
const API_KEY = 'your_api_key';

// GET request
fetch(`${BASE_URL}/resource`, {
  headers: {
    'Authorization': `Bearer ${API_KEY}`
  }
})
.then(response => response.json())
.then(data => console.log(data));

// POST request
fetch(`${BASE_URL}/resource`, {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${API_KEY}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({name: 'New Resource'})
})
.then(response => response.json())
.then(data => console.log(data));
```

### cURL
```bash
# GET
curl -X GET "https://api.example.com/v1/resource" \
  -H "Authorization: Bearer YOUR_TOKEN"

# POST
curl -X POST "https://api.example.com/v1/resource" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"New Resource"}'
```

## Changelog

### v2.0 (YYYY-MM-DD)

- Breaking: Changed authentication to OAuth2
- Added: New `/v2/resources` endpoint
- Deprecated: `/v1/old-endpoint`

### v1.1 (YYYY-MM-DD)

- Added: Pagination support
- Fixed: Rate limiting headers

### v1.0 (YYYY-MM-DD)

- Initial release

## Support

**Documentation:** [Link to full docs]  
**API Status:** [Status page URL]  
**Support Email:** api-support@example.com  
**Community Forum:** [Forum URL]

---

**Last Updated:** YYYY-MM-DD  
**API Version:** v1  
**Maintained by:** @username