# Vault Omni Protocol

A full-stack Web3 DeFi application combining real yield (Aave + GMX), permissionless token deployment, gasless transactions (ERC-4337), multi-validator bridge, AI automation, and cloud mining.

## Features

### 🏦 Real Yield Engine
- **Aave v3 Integration**: Deposit, withdraw, and claim rewards on Ethereum
- **GMX Integration**: Mint GLP, claim rewards, and unstake on Arbitrum
- **AI Yield Agent**: Autonomous strategy generation and auto-rebalancing

### 🪙 Token Launch Studio
- **Permissionless Deployment**: Create custom ERC-20 tokens with configurable supply
- **Token Management**: Mint, burn, and cap enforcement
- **Metadata Storage**: Logo upload and token information persistence

### ⚡ Gasless Transactions
- **ERC-4337 Support**: UserOp sponsorship via Paymaster
- **SmartAccount Creation**: Automatic account abstraction setup
- **Zero Gas Fees**: Eligible operations sponsored by protocol

### 🌉 Multi-Validator Bridge
- **Cross-Chain Transfers**: Lock tokens on source chain, release on destination
- **ECDSA Quorum**: 3-of-5 validator signature requirement
- **Replay Protection**: Nonce-based transaction safety
- **Supported Chains**: Ethereum, BNB Chain, Polygon, Arbitrum

### ⛏️ Cloud Mining
- **HashPower Allocation**: Mine GMX, TRX, or TON
- **Reward Accumulation**: Proportional to hashRate and elapsed time
- **Session Management**: Start, stop, and claim rewards

### 🤖 AI Automation
- **APY Analysis**: Real-time yield opportunity comparison
- **Strategy Generation**: Personalized allocation recommendations
- **Auto-Rebalancing**: Scheduled portfolio optimization

## Tech Stack

### Frontend
- **React 18** + Vite
- **TailwindCSS** with Y2K design system
- **Framer Motion** for animations
- **Web3Modal v3** + wagmi + viem
- **ethers.js v6** for contract interactions
- **fast-check** for property-based testing

### Backend
- **Node.js** + Express.js
- **Prisma ORM** with PostgreSQL
- **fast-check** for property-based testing
- **Vitest** for unit testing

### Smart Contracts
- **Solidity** (Hardhat)
- **OpenZeppelin** contracts
- **Foundry** for fuzz testing

## Getting Started

### Prerequisites
- Node.js 18+
- PostgreSQL 15+
- Docker (optional)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/vault-omni/protocol.git
cd vault-omni-protocol
```

2. **Install dependencies**
```bash
npm install
npm install -w frontend
npm install -w backend
npm install -w contracts
```

3. **Set up environment variables**
```bash
cp .env.example .env.local
# Edit .env.local with your configuration
```

4. **Set up database**
```bash
cd backend
npm run migrate
npm run seed
```

### Development

**Start all services (frontend + backend)**
```bash
npm run dev
```

**Start individual services**
```bash
# Frontend (localhost:5173)
npm run dev -w frontend

# Backend (localhost:3001)
npm run dev -w backend

# Smart contracts (compile)
npm run build -w contracts
```

### Testing

**Run all tests**
```bash
npm run test
```

**Run tests by package**
```bash
npm run test -w frontend
npm run test -w backend
npm run test -w contracts
```

**Run property-based tests**
```bash
# Backend services (fast-check)
npm run test -w backend -- --grep "Property"

# Smart contracts (Foundry)
cd contracts && forge test
```

### Building

**Build all packages**
```bash
npm run build
```

**Build individual packages**
```bash
npm run build -w frontend    # Creates dist/
npm run build -w backend     # Compiles TypeScript
npm run build -w contracts   # Compiles Solidity
```

## Deployment

### Smart Contracts

1. **Configure network in `contracts/hardhat.config.ts`**
2. **Set `PRIVATE_KEY` in `.env.local`**
3. **Deploy contracts**
```bash
cd contracts
npx hardhat run scripts/deploy.ts --network ethereum
```

### Backend

**Using Docker**
```bash
docker-compose up -d
```

**Manual deployment**
```bash
cd backend
npm run build
npm run migrate
npm start
```

**Environment variables required:**
- `DATABASE_URL`: PostgreSQL connection string
- `PAYMASTER_KEY`: ERC-4337 Paymaster private key
- `BUNDLER_URL`: UserOp Bundler endpoint
- `VALIDATOR_KEYS`: Comma-separated validator private keys
- `RPC_*`: RPC URLs for all supported chains

### Frontend

**Build for production**
```bash
cd frontend
npm run build
```

**Deploy to CDN**
```bash
# Upload dist/ folder to your CDN
# Set VITE_* environment variables in deployment
```

## API Reference

### Authentication
All write endpoints require wallet signature authentication via `x-address` header.

### Endpoints

#### Tokens
- `POST /api/token/save` - Save token metadata
- `GET /api/tokens` - Get user's tokens

#### Bridge
- `GET /api/bridge/history` - Get bridge transaction history

#### Yield
- `GET /api/yield/data` - Get yield farming data

#### Gasless
- `POST /api/gasless/execute` - Execute gasless transaction

#### Mining
- `POST /api/mining/start` - Start mining session
- `POST /api/mining/stop` - Stop mining session
- `GET /api/mining/sessions` - Get user's mining sessions
- `POST /api/mining/claim` - Claim mining rewards

#### Upload
- `POST /api/upload` - Upload file (logo, etc.)

## Architecture

### Data Flow

**Token Creation**
1. User deploys token via TokenFactory
2. Frontend POSTs metadata to `/api/token/save`
3. Backend persists to PostgreSQL
4. User views token in Dashboard

**Bridge Transfer**
1. User locks tokens via BridgeLock
2. Backend listens for LockEvent
3. Validators collect ECDSA signatures
4. Backend submits BridgeRelease with signatures
5. Tokens release on destination chain

**Mining Session**
1. User starts mining via `/api/mining/start`
2. Backend creates MiningSession record
3. Reward accumulation loop ticks every 60s
4. User stops mining → finalizes accumulatedReward
5. User claims rewards → marks session as claimed

## Security

### Smart Contracts
- ✅ OpenZeppelin audited contracts
- ✅ ECDSA signature verification
- ✅ Nonce-based replay protection
- ✅ Owner-restricted functions
- ✅ Supply cap enforcement

### Backend
- ✅ Wallet signature authentication
- ✅ Structured error responses
- ✅ Input validation
- ✅ Rate limiting (recommended)
- ✅ CORS configuration

### Frontend
- ✅ Web3Modal security
- ✅ Message signing verification
- ✅ Chain validation
- ✅ Error boundary handling

## Testing

### Test Coverage
- **Smart Contracts**: 15+ unit tests + 8 property tests
- **Backend Services**: 20+ unit tests + 12 property tests
- **Frontend Web3**: 7 module tests + 8 property tests
- **Frontend Pages**: 6 page tests + 6 property tests
- **Integration**: 9 end-to-end flows

### Property-Based Tests
All property-based tests run with 100+ iterations:
- Smart contracts: Foundry fuzz testing
- Backend: fast-check
- Frontend: fast-check + React Testing Library

## Supported Chains

| Chain | ChainID | Aave | GMX | Bridge |
|-------|---------|------|-----|--------|
| Ethereum | 1 | ✅ | ❌ | ✅ |
| BNB Chain | 56 | ❌ | ❌ | ✅ |
| Polygon | 137 | ❌ | ❌ | ✅ |
| Arbitrum | 42161 | ❌ | ✅ | ✅ |

## Configuration

### Environment Variables

**Frontend** (`.env.local`)
```
VITE_RPC_ETHEREUM=...
VITE_RPC_BNB=...
VITE_RPC_POLYGON=...
VITE_RPC_ARBITRUM=...
VITE_AAVE_POOL_ADDRESS=...
VITE_GMX_REWARD_ROUTER=...
VITE_GMX_ROUTER=...
```

**Backend** (`.env.local`)
```
DATABASE_URL=...
PAYMASTER_KEY=...
BUNDLER_URL=...
VALIDATOR_KEYS=...
RPC_ETHEREUM=...
RPC_BNB=...
RPC_POLYGON=...
RPC_ARBITRUM=...
MINING_REWARD_INTERVAL_MS=60000
MINING_BASE_RATES={"GMX":0.001,"TRX":0.05,"TON":0.02}
```

**Contracts** (`.env.local`)
```
PRIVATE_KEY=...
ETHERSCAN_API_KEY=...
HARDHAT_NETWORK=ethereum
```

## Performance

### Optimizations
- ✅ Concurrent data fetching with `Promise.allSettled`
- ✅ Lazy loading for pages
- ✅ Memoization for expensive computations
- ✅ Database query optimization
- ✅ Contract call batching

### Responsive Design
- ✅ Mobile (375px)
- ✅ Tablet (768px)
- ✅ Desktop (1920px)

## Troubleshooting

### Database Connection
```bash
# Verify PostgreSQL is running
psql -U vault_user -d vault_omni

# Run migrations
npm run migrate -w backend
```

### RPC Rate Limits
- Use multiple RPC endpoints
- Implement rate limiting
- Consider using Alchemy or Infura

### Contract Deployment
- Verify network configuration in `hardhat.config.ts`
- Check private key has sufficient funds
- Verify contract addresses after deployment

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License - see LICENSE file for details

## Support

For issues and questions:
- GitHub Issues: https://github.com/vault-omni/protocol/issues
- Documentation: https://docs.vault-omni.com
- Discord: https://discord.gg/vault-omni

## Roadmap

- [ ] Mainnet deployment
- [ ] Additional yield protocols (Curve, Lido)
- [ ] Advanced AI strategies
- [ ] Mobile app
- [ ] DAO governance
- [ ] Staking rewards

---

**Built with ❤️ by the Vault Omni team**
