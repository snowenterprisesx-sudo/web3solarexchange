# Vault Omni Protocol - Deployment Guide

## Pre-Deployment Checklist

- [ ] All tests passing (`npm run test`)
- [ ] Environment variables configured (`.env.local`)
- [ ] Database migrations ready
- [ ] Smart contracts compiled and tested
- [ ] Frontend build optimized
- [ ] Backend dependencies installed
- [ ] Docker images built (if using Docker)

## Smart Contract Deployment

### 1. Prepare Deployment

```bash
cd contracts

# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Run fuzz tests
forge test
```

### 2. Configure Network

Edit `hardhat.config.ts`:
```typescript
networks: {
  ethereum: {
    url: process.env.RPC_ETHEREUM,
    accounts: [process.env.PRIVATE_KEY],
  },
  bsc: {
    url: process.env.RPC_BNB,
    accounts: [process.env.PRIVATE_KEY],
  },
  polygon: {
    url: process.env.RPC_POLYGON,
    accounts: [process.env.PRIVATE_KEY],
  },
  arbitrum: {
    url: process.env.RPC_ARBITRUM,
    accounts: [process.env.PRIVATE_KEY],
  },
}
```

### 3. Deploy Contracts

```bash
# Deploy to Ethereum
npx hardhat run scripts/deploy.ts --network ethereum

# Deploy to other chains
npx hardhat run scripts/deploy.ts --network bsc
npx hardhat run scripts/deploy.ts --network polygon
npx hardhat run scripts/deploy.ts --network arbitrum
```

### 4. Verify Contracts (Optional)

```bash
npx hardhat verify --network ethereum <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

### 5. Save Deployment Addresses

Create `contracts/deployments.json`:
```json
{
  "ethereum": {
    "vaultToken": "0x...",
    "tokenFactory": "0x...",
    "bridgeLock": "0x...",
    "bridgeRelease": "0x...",
    "validatorRegistry": "0x..."
  },
  "bsc": { ... },
  "polygon": { ... },
  "arbitrum": { ... }
}
```

## Backend Deployment

### Option 1: Docker Deployment

```bash
# Build Docker image
docker build -t vault-omni-backend:latest ./backend

# Run with docker-compose
docker-compose up -d

# Check logs
docker-compose logs -f backend
```

### Option 2: Manual Deployment

```bash
cd backend

# Install dependencies
npm install

# Build TypeScript
npm run build

# Run migrations
npm run migrate

# Start server
npm start
```

### Environment Variables

Create `.env.local` in backend directory:
```
DATABASE_URL=postgresql://user:password@host:5432/vault_omni
PAYMASTER_KEY=0x...
BUNDLER_URL=https://...
VALIDATOR_KEYS=0x...,0x...,0x...,0x...,0x...
RPC_ETHEREUM=https://...
RPC_BNB=https://...
RPC_POLYGON=https://...
RPC_ARBITRUM=https://...
MINING_REWARD_INTERVAL_MS=60000
MINING_BASE_RATES={"GMX":0.001,"TRX":0.05,"TON":0.02}
NODE_ENV=production
PORT=3001
```

### Database Setup

```bash
# Create database
createdb vault_omni

# Run migrations
npm run migrate

# Seed test data (optional)
npm run seed
```

### Health Check

```bash
curl http://localhost:3001/health
```

## Frontend Deployment

### 1. Build for Production

```bash
cd frontend

# Install dependencies
npm install

# Build
npm run build

# Output: dist/ folder
```

### 2. Environment Variables

Create `.env.local`:
```
VITE_RPC_ETHEREUM=https://...
VITE_RPC_BNB=https://...
VITE_RPC_POLYGON=https://...
VITE_RPC_ARBITRUM=https://...
VITE_AAVE_POOL_ADDRESS=0x...
VITE_GMX_REWARD_ROUTER=0x...
VITE_GMX_ROUTER=0x...
```

### 3. Deploy to CDN

**Vercel**
```bash
npm install -g vercel
vercel --prod
```

**Netlify**
```bash
npm install -g netlify-cli
netlify deploy --prod --dir=dist
```

**AWS S3 + CloudFront**
```bash
aws s3 sync dist/ s3://vault-omni-frontend/
aws cloudfront create-invalidation --distribution-id <ID> --paths "/*"
```

**GitHub Pages**
```bash
npm run build
git add dist/
git commit -m "Deploy frontend"
git push origin main
```

## Post-Deployment Verification

### 1. Smart Contracts

```bash
# Verify contract deployment
npx hardhat verify --network ethereum <ADDRESS>

# Check contract state
npx hardhat run scripts/verify-deployment.ts --network ethereum
```

### 2. Backend

```bash
# Check health endpoint
curl https://api.vault-omni.com/health

# Check database connection
curl https://api.vault-omni.com/api/tokens \
  -H "x-address: 0x..."

# Check mining service
curl https://api.vault-omni.com/api/mining/sessions \
  -H "x-address: 0x..."
```

### 3. Frontend

```bash
# Check frontend loads
curl https://vault-omni.com

# Check Web3 connection
# Open browser console and verify wallet connection works
```

## Smoke Tests

### 1. Token Creation Flow

```bash
# 1. Deploy token via TokenFactory
# 2. POST to /api/token/save
# 3. GET /api/tokens to verify persistence
```

### 2. Mining Session Flow

```bash
# 1. POST /api/mining/start
# 2. Wait 60 seconds for reward accumulation
# 3. POST /api/mining/stop
# 4. POST /api/mining/claim
# 5. Verify rewards claimed
```

### 3. Bridge Transfer Flow

```bash
# 1. Lock tokens on source chain
# 2. Verify LockEvent emitted
# 3. Collect validator signatures
# 4. Submit BridgeRelease
# 5. Verify tokens released on destination
```

### 4. Yield Farming Flow

```bash
# 1. Deposit to Aave
# 2. Verify balance updated
# 3. Claim rewards
# 4. Verify rewards received
```

## Monitoring

### Backend Monitoring

```bash
# Check logs
docker-compose logs -f backend

# Monitor database
psql -U vault_user -d vault_omni -c "SELECT COUNT(*) FROM mining_session;"

# Monitor API performance
curl -w "@curl-format.txt" -o /dev/null -s https://api.vault-omni.com/health
```

### Frontend Monitoring

```bash
# Check build size
npm run build
du -sh dist/

# Check performance
npm run build -- --analyze
```

### Smart Contract Monitoring

```bash
# Monitor contract events
ethers.provider.on("block", async (blockNumber) => {
  const logs = await ethers.provider.getLogs({
    address: BRIDGE_LOCK_ADDRESS,
    fromBlock: blockNumber - 1,
    toBlock: blockNumber,
  });
});
```

## Rollback Procedure

### Backend Rollback

```bash
# Stop current version
docker-compose down

# Revert database migrations
npm run migrate:down

# Deploy previous version
docker-compose up -d
```

### Frontend Rollback

```bash
# Revert to previous deployment
# Vercel: vercel rollback
# Netlify: netlify deploy --prod --dir=dist-previous
# AWS: aws cloudfront create-invalidation --distribution-id <ID> --paths "/*"
```

### Smart Contract Rollback

```bash
# Deploy new contract version
npx hardhat run scripts/deploy.ts --network ethereum

# Update contract addresses in backend
# Update contract addresses in frontend
```

## Security Checklist

- [ ] Private keys stored in secure vault (not in code)
- [ ] Database credentials encrypted
- [ ] API endpoints have rate limiting
- [ ] CORS configured correctly
- [ ] HTTPS enabled on all endpoints
- [ ] Environment variables validated at startup
- [ ] Error messages don't leak sensitive info
- [ ] Contract addresses verified on all chains
- [ ] Validator keys secured
- [ ] Paymaster key secured

## Performance Optimization

### Backend
- [ ] Database indexes created
- [ ] Query optimization completed
- [ ] Caching implemented
- [ ] Rate limiting configured
- [ ] Load balancing setup

### Frontend
- [ ] Code splitting enabled
- [ ] Images optimized
- [ ] CSS minified
- [ ] JavaScript minified
- [ ] CDN configured

### Smart Contracts
- [ ] Gas optimization completed
- [ ] Contract size verified
- [ ] Storage layout optimized

## Maintenance

### Regular Tasks
- [ ] Monitor error logs daily
- [ ] Check database size weekly
- [ ] Review performance metrics weekly
- [ ] Update dependencies monthly
- [ ] Run security audit quarterly

### Backup Strategy
- [ ] Database backups daily
- [ ] Contract ABI backups
- [ ] Deployment addresses backed up
- [ ] Environment variables backed up (encrypted)

## Support

For deployment issues:
1. Check logs: `docker-compose logs -f`
2. Verify environment variables
3. Check database connection
4. Verify RPC endpoints
5. Check contract addresses
6. Review error messages

## Troubleshooting

### Database Connection Failed
```bash
# Check PostgreSQL is running
docker-compose ps

# Check connection string
echo $DATABASE_URL

# Test connection
psql $DATABASE_URL
```

### Contract Deployment Failed
```bash
# Check private key has funds
ethers.provider.getBalance(deployer.address)

# Check network configuration
npx hardhat network-info

# Check RPC endpoint
curl $RPC_ETHEREUM
```

### Frontend Build Failed
```bash
# Clear cache
rm -rf node_modules dist

# Reinstall
npm install

# Rebuild
npm run build
```

---

**Last Updated**: 2024
**Version**: 1.0.0
