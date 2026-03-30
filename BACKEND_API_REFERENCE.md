# Backend API Reference - Vault Omni Protocol

## Base URL
```
http://localhost:3001
```

## Authentication

All write operations (POST, PUT, DELETE) require wallet signature authentication via headers:

```
x-signature: <ECDSA signature>
x-message: <signed message>
x-address: <wallet address>
```

Example:
```javascript
const message = "Sign this message to authenticate";
const signature = await signer.signMessage(message);

const headers = {
  'x-signature': signature,
  'x-message': message,
  'x-address': walletAddress,
};
```

## Endpoints

### Health Check

#### GET /health
Check if backend is running.

**Response:**
```json
{
  "status": "ok"
}
```

---

### File Upload

#### POST /api/upload
Upload a file (logo, image, etc.).

**Request:**
- Content-Type: `multipart/form-data`
- Field: `file` (image file, max 5MB)

**Response:**
```json
{
  "url": "/uploads/file-1234567890-abcdef.png"
}
```

**Errors:**
- 400: No file uploaded or invalid file type
- 413: File too large (>5MB)

---

### Token Management

#### POST /api/token/save
Save token metadata after deployment.

**Authentication:** Required

**Request:**
```json
{
  "name": "My Token",
  "symbol": "MTK",
  "supply": "1000000",
  "decimals": 18,
  "contractAddress": "0x...",
  "chain": 1,
  "logoUrl": "/uploads/logo.png",
  "metadata": {
    "website": "https://example.com",
    "twitter": "@example"
  }
}
```

**Response:**
```json
{
  "id": "cuid123",
  "name": "My Token",
  "symbol": "MTK",
  "supply": "1000000",
  "decimals": 18,
  "contractAddress": "0x...",
  "chain": 1,
  "logoUrl": "/uploads/logo.png",
  "metadata": {...},
  "owner": "0x...",
  "createdAt": "2024-01-01T00:00:00Z"
}
```

**Errors:**
- 400: Missing required fields
- 401: Unauthorized (invalid signature)
- 409: Duplicate contractAddress

#### GET /api/tokens
Retrieve all tokens created by authenticated wallet.

**Authentication:** Required

**Response:**
```json
[
  {
    "id": "cuid123",
    "name": "My Token",
    "symbol": "MTK",
    "supply": "1000000",
    "decimals": 18,
    "contractAddress": "0x...",
    "chain": 1,
    "logoUrl": "/uploads/logo.png",
    "metadata": {...},
    "owner": "0x...",
    "createdAt": "2024-01-01T00:00:00Z"
  }
]
```

**Errors:**
- 401: Unauthorized (invalid signature)

---

### Bridge

#### GET /api/bridge/history
Retrieve bridge transaction history for authenticated wallet.

**Authentication:** Required

**Response:**
```json
[
  {
    "id": "cuid123",
    "fromChain": 1,
    "toChain": 42161,
    "amount": "1000000000000000000",
    "txHash": "0x...",
    "status": "completed",
    "userAddress": "0x...",
    "createdAt": "2024-01-01T00:00:00Z"
  }
]
```

**Errors:**
- 401: Unauthorized (invalid signature)

---

### Yield Data

#### GET /api/yield/data
Retrieve current APY rates and user yield data.

**Response:**
```json
{
  "aaveAPY": 3.5,
  "gmxAPY": 12.8,
  "stale": false,
  "userAaveBalance": "1000000000000000000",
  "userGmxBalance": "500000000000000000",
  "userClaimableRewards": "100000000000000000"
}
```

**Errors:**
- 503: Unable to fetch APY data (returns cached data with `stale: true`)

---

### Gasless Transactions

#### POST /api/gasless/execute
Sponsor and submit a gasless transaction via ERC-4337.

**Authentication:** Required

**Request:**
```json
{
  "txData": {
    "to": "0x...",
    "data": "0x...",
    "from": "0x...",
    "value": "0"
  }
}
```

**Response:**
```json
{
  "userOpHash": "0x..."
}
```

**Errors:**
- 400: Invalid txData (missing to or data)
- 401: Unauthorized (invalid signature)
- 502: Bundler error

---

### Mining

#### POST /api/mining/start
Start a new mining session.

**Authentication:** Required

**Request:**
```json
{
  "coin": "GMX",
  "hashRate": 100
}
```

**Response:**
```json
{
  "sessionId": "cuid123"
}
```

**Errors:**
- 400: Invalid hashRate (must be > 0) or missing fields
- 401: Unauthorized (invalid signature)

#### POST /api/mining/stop
Stop an active mining session.

**Request:**
```json
{
  "sessionId": "cuid123"
}
```

**Response:**
```json
{
  "accumulatedReward": 123.45
}
```

**Errors:**
- 400: Missing sessionId
- 404: Session not found

#### GET /api/mining/sessions
Retrieve all mining sessions for authenticated wallet.

**Authentication:** Required

**Response:**
```json
[
  {
    "id": "cuid123",
    "walletAddress": "0x...",
    "coin": "GMX",
    "hashRate": 100,
    "startedAt": "2024-01-01T00:00:00Z",
    "accumulatedReward": 123.45,
    "status": "active"
  }
]
```

**Errors:**
- 401: Unauthorized (invalid signature)

#### POST /api/mining/claim
Claim rewards from a mining session.

**Request:**
```json
{
  "sessionId": "cuid123"
}
```

**Response:**
```json
{
  "claimableAmount": 123.45
}
```

**Errors:**
- 400: Missing sessionId
- 404: Session not found
- 409: Rewards already claimed

---

## Error Response Format

All errors follow this structure:

```json
{
  "error": "Descriptive error message",
  "code": "ERROR_CODE"
}
```

**Common Error Codes:**
- `UNAUTHORIZED` - Missing or invalid authentication
- `INVALID_INPUT` - Missing or invalid request fields
- `INVALID_HASH_RATE` - Hash rate must be > 0
- `SESSION_NOT_FOUND` - Mining session not found
- `ALREADY_CLAIMED` - Rewards already claimed
- `DUPLICATE_CONTRACT_ADDRESS` - Token already exists
- `INVALID_TX_DATA` - Invalid transaction data
- `BUNDLER_ERROR` - Bundler submission failed
- `APY_FETCH_FAILED` - Unable to fetch APY data
- `NO_FILE` - No file uploaded
- `INTERNAL_ERROR` - Unexpected server error

---

## HTTP Status Codes

- `200` - Success
- `400` - Bad Request (invalid input)
- `401` - Unauthorized (missing/invalid authentication)
- `404` - Not Found (resource doesn't exist)
- `409` - Conflict (duplicate entry)
- `413` - Payload Too Large (file too large)
- `500` - Internal Server Error
- `502` - Bad Gateway (bundler error)
- `503` - Service Unavailable (external service error)

---

## Example: Complete Token Creation Flow

### 1. Upload Logo
```bash
curl -X POST http://localhost:3001/api/upload \
  -F "file=@logo.png"
```

Response:
```json
{
  "url": "/uploads/file-1234567890-abcdef.png"
}
```

### 2. Deploy Token (via frontend wallet)
Frontend calls `TokenFactory.createToken()` and gets `contractAddress` and `txHash`.

### 3. Save Token Metadata
```bash
curl -X POST http://localhost:3001/api/token/save \
  -H "Content-Type: application/json" \
  -H "x-signature: 0x..." \
  -H "x-message: Sign this message to authenticate" \
  -H "x-address: 0x..." \
  -d '{
    "name": "My Token",
    "symbol": "MTK",
    "supply": "1000000",
    "decimals": 18,
    "contractAddress": "0x...",
    "chain": 1,
    "logoUrl": "/uploads/file-1234567890-abcdef.png",
    "metadata": {
      "website": "https://example.com"
    }
  }'
```

### 4. Retrieve Tokens
```bash
curl -X GET http://localhost:3001/api/tokens \
  -H "x-signature: 0x..." \
  -H "x-message: Sign this message to authenticate" \
  -H "x-address: 0x..."
```

---

## Example: Complete Mining Flow

### 1. Start Mining Session
```bash
curl -X POST http://localhost:3001/api/mining/start \
  -H "Content-Type: application/json" \
  -H "x-signature: 0x..." \
  -H "x-message: Sign this message to authenticate" \
  -H "x-address: 0x..." \
  -d '{
    "coin": "GMX",
    "hashRate": 100
  }'
```

Response:
```json
{
  "sessionId": "cuid123"
}
```

### 2. Get Mining Sessions
```bash
curl -X GET http://localhost:3001/api/mining/sessions \
  -H "x-signature: 0x..." \
  -H "x-message: Sign this message to authenticate" \
  -H "x-address: 0x..."
```

### 3. Stop Mining Session
```bash
curl -X POST http://localhost:3001/api/mining/stop \
  -H "Content-Type: application/json" \
  -d '{
    "sessionId": "cuid123"
  }'
```

### 4. Claim Rewards
```bash
curl -X POST http://localhost:3001/api/mining/claim \
  -H "Content-Type: application/json" \
  -d '{
    "sessionId": "cuid123"
  }'
```

---

## Environment Variables

Required for backend to run:

```
DATABASE_URL=postgresql://user:password@localhost:5432/vault_omni
PAYMASTER_KEY=0x...
BUNDLER_URL=https://bundler.example.com
VALIDATOR_KEYS=0x...,0x...,0x...
RPC_ETHEREUM=https://eth-mainnet.g.alchemy.com/v2/...
RPC_BNB=https://bsc-dataseed.bnbchain.org
RPC_POLYGON=https://polygon-rpc.com
RPC_ARBITRUM=https://arb1.arbitrum.io/rpc
MINING_REWARD_INTERVAL_MS=60000
MINING_BASE_RATES={"GMX":0.001,"TRX":0.05,"TON":0.02}
```

