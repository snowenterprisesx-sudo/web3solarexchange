# ⚡ Quick Setup: Push Code to GitHub & Deploy to Vercel

## **Your GitHub Repo**
```
https://github.com/snowenterprisesx-sudo/WEB3.git
```

---

## **OPTION 1: Push Code to GitHub (Recommended)**

### Step 1: Open Kiro Terminal
- Press `Ctrl + ~` or click **Terminal** tab at bottom

### Step 2: Configure Git (First Time Only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Add GitHub Remote
```bash
git remote add origin https://github.com/snowenterprisesx-sudo/WEB3.git
```

### Step 4: Push Your Code
```bash
git add .
git commit -m "Vault Omni Protocol - Complete Implementation"
git branch -M main
git push -u origin main
```

**If you get an error about authentication:**
1. Go to https://github.com/settings/tokens
2. Click **Generate new token (classic)**
3. Select scopes: `repo`, `workflow`
4. Copy the token
5. When prompted for password, paste the token

---

## **OPTION 2: Deploy to Vercel (After Pushing to GitHub)**

### Step 1: Go to Vercel
Open https://vercel.com in your browser

### Step 2: Sign Up with GitHub
1. Click **Sign Up**
2. Click **GitHub**
3. Click **Authorize Vercel**

### Step 3: Import Your Repository
1. Click **Add New** → **Project**
2. Click **Import Git Repository**
3. Search for `WEB3`
4. Click `snowenterprisesx-sudo/WEB3`
5. Click **Import**

### Step 4: Configure Build Settings
Make sure these are set:
- **Root Directory**: `frontend`
- **Build Command**: `npm run build`
- **Output Directory**: `dist`

### Step 5: Add Environment Variables
Click **Environment Variables** and add:

```
VITE_RPC_ETHEREUM=https://eth-mainnet.g.alchemy.com/v2/YOUR_ALCHEMY_KEY
VITE_RPC_BNB=https://bsc-dataseed.bnbchain.org
VITE_RPC_POLYGON=https://polygon-rpc.com
VITE_RPC_ARBITRUM=https://arb1.arbitrum.io/rpc
VITE_AAVE_POOL_ADDRESS=0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9
VITE_GMX_REWARD_ROUTER=0xA906F3863E78368F3B6135D3C51A8E63B8d1f684
VITE_GMX_ROUTER=0xaBBc5F99639c9B6bCb58544ddf04EFA6802F4064
```

### Step 6: Deploy
Click **Deploy** button

**Wait 2-3 minutes...**

### Step 7: Get Your Live URL
You'll see: `https://vault-omni-protocol.vercel.app` (or similar)

**That's it! Your site is live!** 🎉

---

## **OPTION 3: Deploy from Kiro Terminal**

### Step 1: Install Vercel CLI
```bash
npm install -g vercel
```

### Step 2: Login
```bash
vercel login
```
- Opens browser
- Click **Authorize**

### Step 3: Deploy
```bash
cd frontend
vercel --prod
```

---

## **Verify Everything Works**

### Check GitHub
1. Go to https://github.com/snowenterprisesx-sudo/WEB3
2. You should see all your files

### Check Vercel
1. Go to https://vercel.com/dashboard
2. Click your project
3. See deployment status

### Check Your Live Site
1. Visit your Vercel URL
2. You should see your UI with all pages

---

## **Troubleshooting**

### "Git not found"
- Install Git from https://git-scm.com/download/win
- Restart Kiro

### "Authentication failed"
- Use GitHub Personal Access Token instead of password
- Get token at https://github.com/settings/tokens

### "Build failed on Vercel"
1. Check build logs: Dashboard → Deployments → Failed build
2. Common issues:
   - Missing environment variables
   - Wrong root directory
   - TypeScript errors

### "Site shows blank page"
1. Open DevTools (F12)
2. Check Console for errors
3. Verify environment variables are set

---

## **Next: Automatic Deployments**

Once connected, every time you push to GitHub:

```bash
git add .
git commit -m "Your changes"
git push origin main
```

Vercel automatically deploys within 1-2 minutes! ✨

---

## **Your URLs**

| What | URL |
|-----|-----|
| GitHub Repo | https://github.com/snowenterprisesx-sudo/WEB3 |
| Vercel Dashboard | https://vercel.com/dashboard |
| Your Live Site | https://vault-omni-protocol.vercel.app |

---

**Ready? Start with Step 1 above!** 🚀

