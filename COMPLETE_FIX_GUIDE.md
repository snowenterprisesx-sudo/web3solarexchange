# 🔧 Complete Fix Guide - Terminal & Dependencies

## **PROBLEM SUMMARY**

❌ **Node.js is NOT installed** - This is the main issue
❌ **npm is NOT installed** - Can't run any commands
❌ **Dependencies not installed** - Missing @prisma/client and others

---

## **SOLUTION: 3-STEP FIX**

### **STEP 1: Install Node.js (5-10 minutes)**

#### **Download**
1. Go to: https://nodejs.org
2. Click **LTS** (Long Term Support)
3. Download for Windows
4. Run the installer
5. Click **Next** through all steps
6. Click **Install**
7. Click **Finish**

#### **Restart Computer**
- This is IMPORTANT!
- Restart your computer after installation

#### **Verify Installation**
Open a new terminal and run:
```bash
node --version
npm --version
```

You should see version numbers (e.g., v18.17.0, 9.6.7)

---

### **STEP 2: Install Project Dependencies (2-5 minutes)**

#### **Open Kiro Terminal**
```
Press: Ctrl + ~
```

#### **Navigate to Project**
```bash
cd /path/to/your/project
```

Or check current location:
```bash
pwd
```

#### **Install Dependencies**
```bash
npm install
```

Wait for this to complete. You'll see:
```
added XXX packages in X.XXs
```

---

### **STEP 3: Run Your UI (30 seconds)**

#### **Start Dev Server**
```bash
npm run dev
```

#### **Open in Browser**
```
Look for: Local: http://localhost:5173
Click it!
```

#### **Enjoy Your UI!**
Your complete Vault Omni Protocol UI opens in browser 🎉

---

## **DETAILED INSTALLATION GUIDE**

### **Part 1: Install Node.js on Windows**

#### **Step 1: Download**
1. Open browser
2. Go to https://nodejs.org
3. Click **LTS** button (green button on left)
4. File downloads: `node-vXX.XX.X-x64.msi`

#### **Step 2: Run Installer**
1. Find downloaded file in Downloads folder
2. Double-click to run
3. Click **Yes** if prompted by User Account Control

#### **Step 3: Follow Installation Wizard**
1. **Welcome**: Click **Next**
2. **License**: Check "I accept" → Click **Next**
3. **Destination**: Keep default → Click **Next**
4. **Custom Setup**: Keep defaults → Click **Next**
5. **Tools**: Keep defaults → Click **Next**
6. **Ready to Install**: Click **Install**
7. Wait 1-2 minutes for installation
8. **Completed**: Click **Finish**

#### **Step 4: Restart Computer**
- Click **Start** → **Power** → **Restart**
- Wait for restart to complete
- This is IMPORTANT for PATH configuration

#### **Step 5: Verify Installation**
1. Open Command Prompt or PowerShell
2. Type: `node --version`
3. Should show: `v18.17.0` (or similar)
4. Type: `npm --version`
5. Should show: `9.6.7` (or similar)

---

### **Part 2: Install Project Dependencies**

#### **Step 1: Open Kiro Terminal**
- Press `Ctrl + ~` in Kiro
- Or click **Terminal** tab at bottom

#### **Step 2: Check Location**
```bash
pwd
```

Should show your project directory

#### **Step 3: Install Dependencies**
```bash
npm install
```

Wait for completion. You'll see:
```
added 500+ packages in 3.45s
```

---

### **Part 3: Run Your UI**

#### **Step 1: Start Dev Server**
```bash
npm run dev
```

#### **Step 2: Wait for Server**
You'll see:
```
VITE v4.x.x  ready in xxx ms

➜  Local:   http://localhost:5173/
➜  press h to show help
```

#### **Step 3: Open in Browser**
- Click `http://localhost:5173/`
- Or copy-paste into browser address bar

#### **Step 4: Enjoy Your UI!**
Your complete Vault Omni Protocol UI opens 🎉

---

## **TROUBLESHOOTING**

### **"npm: command not found"**

**Cause**: Node.js not installed or PATH not updated

**Solution**:
1. Install Node.js from https://nodejs.org
2. Restart computer
3. Open NEW terminal window
4. Try `npm --version` again

### **"npm install" fails**

**Cause**: Network issue or corrupted cache

**Solution**:
```bash
# Clear npm cache
npm cache clean --force

# Try install again
npm install
```

### **"Port 5173 already in use"**

**Cause**: Another process using the port

**Solution**:
```bash
# Kill the process
netstat -ano | findstr :5173
taskkill /PID <PID> /F

# Try again
npm run dev
```

### **"Cannot find module '@prisma/client'"**

**Cause**: Dependencies not installed

**Solution**:
```bash
# Install dependencies
npm install

# If still fails
rm -rf node_modules
npm install
```

### **"Blank page in browser"**

**Cause**: Build error or missing environment variables

**Solution**:
1. Press `F12` (DevTools)
2. Click **Console** tab
3. Look for red error messages
4. Check `.env.local` file exists
5. Try hard reload: `Ctrl + Shift + R`

---

## **QUICK CHECKLIST**

### **Before Running npm Commands**

- [ ] Node.js installed (verify: `node --version`)
- [ ] npm installed (verify: `npm --version`)
- [ ] Computer restarted after Node.js installation
- [ ] In correct project directory
- [ ] Dependencies installed (`npm install` completed)

### **Running Your UI**

- [ ] Terminal open (`Ctrl + ~`)
- [ ] Run `npm run dev`
- [ ] See `Local: http://localhost:5173`
- [ ] Click the link
- [ ] Browser opens
- [ ] UI loads
- [ ] All pages accessible
- [ ] Animations working

---

## **WHAT EACH COMMAND DOES**

| Command | Purpose |
|---------|---------|
| `node --version` | Check Node.js installation |
| `npm --version` | Check npm installation |
| `npm install` | Install project dependencies |
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm run test` | Run tests |
| `npm run preview` | Preview production build |

---

## **AFTER EVERYTHING IS FIXED**

### **Your Terminal Will Work**
✅ All npm commands will run
✅ Dev server will start
✅ Your UI will load
✅ Everything will work!

### **You Can Then**
✅ View your UI at `http://localhost:5173`
✅ Test all pages
✅ Test responsive design
✅ Test animations
✅ Explore the code

---

## **ESTIMATED TIME**

| Task | Time |
|------|------|
| Download Node.js | 2 min |
| Install Node.js | 3 min |
| Restart computer | 2 min |
| Install dependencies | 3 min |
| Start dev server | 1 min |
| **Total** | **~11 minutes** |

---

## **NEXT STEPS**

1. **Right Now**: Go to https://nodejs.org
2. **Download**: Click LTS button
3. **Install**: Run the installer
4. **Restart**: Restart your computer
5. **Verify**: Open terminal, run `node --version`
6. **Install Dependencies**: Run `npm install`
7. **Start Dev Server**: Run `npm run dev`
8. **Open UI**: Click `http://localhost:5173`
9. **Enjoy**: Your complete UI is ready!

---

## **SUPPORT**

If you get stuck:
1. Check the troubleshooting section above
2. Verify Node.js is installed: `node --version`
3. Verify npm is installed: `npm --version`
4. Check you're in the right directory: `pwd`
5. Try clearing cache: `npm cache clean --force`

---

**Install Node.js and your terminal will be fixed!** 🚀

