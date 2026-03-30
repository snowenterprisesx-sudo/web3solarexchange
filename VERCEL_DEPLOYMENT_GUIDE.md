# 🚀 Vercel Deployment Guide for Vault Omni Protocol

## Your GitHub Repository
**URL**: https://github.com/snowenterprisesx-sudo/WEB3.git

---

## **STEP 1: Connect Your GitHub Repo to Vercel**

### 1.1 Go to Vercel
1. Open https://vercel.com
2. Click **Sign Up** (or **Log In** if you have an account)
3. Choose **GitHub** as your sign-up method
4. Click **Authorize Vercel** to connect your GitHub account

### 1.2 Import Your Repository
1. After authorization, you'll be on the Vercel dashboard
2. Click **Add New** → **Project**
3. Click **Import Git Repository**
4. Search for: `WEB3`
5. Click the repository: `snowenterprisesx-sudo/WEB3`
6. Click **Import**

---

## **STEP 2: Configure Vercel Project Settings**

### 2.1 Project Name
- **Project Name**: `vault-omni-protocol` (or keep as `WEB3`)
- Click **Continue**

### 2.2 Framework & Build Settings
Vercel should auto-detect, but verify:

| Setting | Value |
|---------|-------|
| **Framework Preset** | Vite |
| **Root Directory** | `frontend` |
| **Build Command** | `npm run build` |
| **Output Directory** | `dist` |
| **Install Command** | `npm install` |

### 2.3 Environment Variables
Click **Environment Variables** and add these:

```
VITE_RPC_ETHEREUM=https://eth-mainnet.g.alchemy.com/v2/YOUR_ALCHEMY_KEY
VITE_RPC_BNB=https://bsc-dataseed.bnbchain.org
VITE_RPC_POLYGON=https://polygon-rpc.com
VITE_RPC_ARBITRUM=https://arb1.arbitrum.io/rpc
VITE_AAVE_POOL_ADDRESS=0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9
VITE_GMX_REWARD_ROUTER=0xA906F3863E78368F3B6135D3C51A8E63B8d1f684
VITE_GMX_ROUTER=0xaBBc5F99639c9B6bCb58544ddf04EFA6802F4064
```

**How to add each variable:**
1. Click **Add New**
2. Enter **Name** (e.g., `VITE_RPC_ETHEREUM`)
3. Enter **Value** (the URL)
4. Click **Save**
5. Repeat for all variables

### 2.4 Deploy
Click **Deploy** button and wait 2-3 minutes for build to complete.

---

## **STEP 3: Your Live URL**

After deployment completes, you'll see:
- **Production URL**: `https://vault-omni-protocol.vercel.app` (or similar)
- **Copy this URL** and share it!

---

## **STEP 4: Set Up Automatic Deployments**

Vercel is now connected to your GitHub repo. Every time you push code:

### 4.1 Push Code from Kiro
```bash
git add .
git commit -m "Update: Your changes"
git push origin main
```

### 4.2 Vercel Automatically Deploys
- Vercel detects the push
- Automatically builds and deploys
- Your live site updates within 1-2 minutes
- Check status at https://vercel.com/dashboard

---

## **STEP 5: Manage Your Deployment**

### 5.1 View Deployment Status
1. Go to https://vercel.com/dashboard
2. Click your project
3. See all deployments and their status

### 5.2 Update Environment Variables
1. Go to **Settings** → **Environment Variables**
2. Edit or add new variables
3. Click **Redeploy** to apply changes

### 5.3 View Build Logs
1. Go to **Deployments**
2. Click the latest deployment
3. Scroll down to see build logs

### 5.4 Rollback to Previous Version
1. Go to **Deployments**
2. Find a previous working deployment
3. Click **...** → **Promote to Production**

---

## **STEP 6: Deploy from Kiro Terminal (Optional)**

If you want to deploy directly from Kiro without pushing to GitHub:

### 6.1 Install Vercel CLI
```bash
npm install -g vercel
```

### 6.2 Login to Vercel
```bash
vercel login
```
- Opens browser to authenticate
- Click **Authorize**

### 6.3 Deploy
```bash
cd frontend
vercel --prod
```

---

## **STEP 7: Add Custom Domain (Optional)**

### 7.1 Go to Domain Settings
1. Vercel Dashboard → Your Project
2. Go to **Settings** → **Domains**

### 7.2 Add Your Domain
1. Click **Add Domain**
2. Enter your domain (e.g., `vault-omni.com`)
3. Follow DNS setup instructions

---

## **STEP 8: Monitor Your Site**

### 8.1 View Analytics
1. Go to **Analytics** tab
2. See page views, response times, errors

### 8.2 Set Up Alerts
1. Go to **Settings** → **Notifications**
2. Enable email alerts for failed deployments

---

## **Quick Reference**

| What | Where |
|-----|-------|
| **Live Site** | https://vault-omni-protocol.vercel.app |
| **Vercel Dashboard** | https://vercel.com/dashboard |
| **GitHub Repo** | https://github.com/snowenterprisesx-sudo/WEB3 |
| **Deployments** | Dashboard → Deployments tab |
| **Environment Variables** | Dashboard → Settings → Environment Variables |
| **Build Logs** | Dashboard → Deployments → Click deployment |

---

## **Troubleshooting**

### Build Fails
1. Check build logs: Dashboard → Deployments → Failed deployment
2. Common issues:
   - Missing environment variables
   - Wrong root directory
   - TypeScript errors

**Fix:**
```bash
# Test build locally first
npm run build -w frontend
```

### Site Shows Blank Page
1. Open browser DevTools (F12)
2. Check **Console** for errors
3. Check **Network** tab for failed requests
4. Verify environment variables are set

### Can't Connect GitHub
1. Go to https://vercel.com/account/integrations
2. Click **GitHub**
3. Click **Authorize** again

---

## **Workflow: Daily Development**

```bash
# 1. Make changes in Kiro
# (Edit files, test with npm run dev)

# 2. Commit changes
git add .
git commit -m "Feature: Description"

# 3. Push to GitHub
git push origin main

# 4. Vercel automatically deploys
# (Check https://vercel.com/dashboard)

# 5. Your live site updates
# (Visit https://vault-omni-protocol.vercel.app)
```

---

## **Environment Variables Explained**

| Variable | Purpose | Example |
|----------|---------|---------|
| `VITE_RPC_ETHEREUM` | Ethereum RPC endpoint | `https://eth-mainnet.g.alchemy.com/v2/...` |
| `VITE_RPC_BNB` | BNB Chain RPC | `https://bsc-dataseed.bnbchain.org` |
| `VITE_RPC_POLYGON` | Polygon RPC | `https://polygon-rpc.com` |
| `VITE_RPC_ARBITRUM` | Arbitrum RPC | `https://arb1.arbitrum.io/rpc` |
| `VITE_AAVE_POOL_ADDRESS` | Aave contract address | `0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9` |
| `VITE_GMX_REWARD_ROUTER` | GMX contract address | `0xA906F3863E78368F3B6135D3C51A8E63B8d1f684` |
| `VITE_GMX_ROUTER` | GMX router address | `0xaBBc5F99639c9B6bCb58544ddf04EFA6802F4064` |

---

## **Next Steps**

1. ✅ Go to https://vercel.com
2. ✅ Sign up with GitHub
3. ✅ Import your WEB3 repository
4. ✅ Add environment variables
5. ✅ Click Deploy
6. ✅ Share your live URL!

**Your site will be live in 2-3 minutes!** 🎉

---

## **Support**

- **Vercel Docs**: https://vercel.com/docs
- **GitHub Issues**: https://github.com/snowenterprisesx-sudo/WEB3/issues
- **Vercel Support**: https://vercel.com/support

