# 🔧 Terminal Fix Guide - Node.js Installation Required

## **PROBLEM IDENTIFIED**

❌ **Node.js is NOT installed on your system**
❌ **npm is NOT installed on your system**
❌ This is why no commands will run in the terminal

---

## **SOLUTION: Install Node.js**

### **Step 1: Download Node.js**

1. Go to: https://nodejs.org
2. Click **LTS** (Long Term Support) - recommended
3. Download the installer for Windows

### **Step 2: Install Node.js**

1. Run the installer
2. Click **Next** through all steps
3. Accept the license agreement
4. Choose installation location (default is fine)
5. Click **Install**
6. Wait for installation to complete
7. Click **Finish**

### **Step 3: Restart Your Computer**

1. Restart your computer
2. This ensures Node.js is added to your system PATH

### **Step 4: Verify Installation**

Open a new terminal and run:

```bash
node --version
npm --version
```

You should see version numbers like:
```
v18.17.0
9.6.7
```

---

## **AFTER INSTALLATION: Run Your UI**

### **Step 1: Open Kiro Terminal**
```
Press: Ctrl + ~
```

### **Step 2: Navigate to Project**
```bash
cd /path/to/your/project
```

Or if already in project directory:
```bash
pwd
```

### **Step 3: Install Dependencies**
```bash
npm install
```

Wait for this to complete (2-5 minutes)

### **Step 4: Start Dev Server**
```bash
npm run dev
```

### **Step 5: Open in Browser**
```
Look for: Local: http://localhost:5173
Click it!
```

---

## **DETAILED INSTALLATION STEPS FOR WINDOWS**

### **Download Node.js**

1. Open browser
2. Go to https://nodejs.org
3. You'll see two buttons:
   - **LTS** (Recommended) - Click this
   - **Current** (Latest features)
4. Click **LTS**
5. Download will start automatically
6. File will be named: `node-vXX.XX.X-x64.msi`

### **Run the Installer**

1. Find the downloaded file (usually in Downloads folder)
2. Double-click to run
3. Click **Yes** if prompted by User Account Control
4. Installer window opens

### **Follow Installation Steps**

1. **Welcome Screen**: Click **Next**
2. **License Agreement**: Check "I accept" and click **Next**
3. **Destination Folder**: Keep default, click **Next**
4. **Custom Setup**: Keep defaults, click **Next**
5. **Tools for Native Modules**: Keep defaults, click **Next**
6. **Ready to Install**: Click **Install**
7. Wait for installation (1-2 minutes)
8. **Completed**: Click **Finish**

### **Restart Computer**

1. Restart your computer
2. This is important for PATH configuration

### **Verify Installation**

1. Open Command Prompt or PowerShell
2. Type: `node --version`
3. You should see: `v18.17.0` (or similar)
4. Type: `npm --version`
5. You should see: `9.6.7` (or similar)

---

## **TROUBLESHOOTING INSTALLATION**

### **"Node.js is already installed but npm won't work"**

**Solution:**
1. Uninstall Node.js completely
2. Restart computer
3. Reinstall Node.js
4. Restart computer again

### **"npm: command not found after installation"**

**Solution:**
1. Restart your computer (important!)
2. Open a NEW terminal window
3. Try `npm --version` again

### **"Installation failed"**

**Solution:**
1. Download the installer again
2. Run as Administrator (right-click → Run as Administrator)
3. Follow all steps
4. Restart computer

### **"Port 5173 already in use"**

**Solution:**
```bash
# Kill the process using port 5173
netstat -ano | findstr :5173
taskkill /PID <PID> /F
```

---

## **AFTER NODE.JS IS INSTALLED**

### **Quick Start (30 seconds)**

```bash
# 1. Open terminal (Ctrl + ~)
# 2. Run dev server
npm run dev

# 3. Click: http://localhost:5173
# 4. Your UI opens!
```

---

## **VERIFY EVERYTHING WORKS**

### **Test 1: Check Node.js**
```bash
node --version
```
Should show: `v18.17.0` or higher

### **Test 2: Check npm**
```bash
npm --version
```
Should show: `9.6.7` or higher

### **Test 3: Check Project**
```bash
npm run dev
```
Should show: `Local: http://localhost:5173`

### **Test 4: Open UI**
1. Click the `http://localhost:5173` link
2. Browser opens
3. You see your UI!

---

## **COMMON ISSUES AFTER INSTALLATION**

### **"npm install" takes too long**

**Normal**: First install takes 2-5 minutes
**Solution**: Be patient, don't interrupt

### **"npm ERR! code EACCES"**

**Solution:**
```bash
# Try with sudo (if on Mac/Linux)
sudo npm install

# Or reinstall Node.js as Administrator (Windows)
```

### **"npm ERR! 404 Not Found"**

**Solution:**
```bash
# Clear npm cache
npm cache clean --force

# Try install again
npm install
```

---

## **NEXT STEPS**

### **After Node.js Installation**

1. ✅ Restart computer
2. ✅ Open new terminal
3. ✅ Verify: `node --version` and `npm --version`
4. ✅ Navigate to project
5. ✅ Run: `npm install`
6. ✅ Run: `npm run dev`
7. ✅ Click: `http://localhost:5173`
8. ✅ Enjoy your UI!

---

## **DOWNLOAD LINKS**

| What | Link |
|------|------|
| Node.js LTS | https://nodejs.org (click LTS) |
| Node.js Latest | https://nodejs.org (click Current) |
| npm Docs | https://docs.npmjs.com |
| Node.js Docs | https://nodejs.org/docs |

---

## **SUMMARY**

**Problem**: Node.js not installed
**Solution**: Install Node.js from https://nodejs.org
**Time**: 5-10 minutes
**Result**: All commands will work!

---

## **After Installation**

Your terminal will work perfectly and you can:
- ✅ Run `npm run dev`
- ✅ Run `npm run build`
- ✅ Run `npm run test`
- ✅ Run any npm command
- ✅ View your UI at `http://localhost:5173`

---

**Install Node.js now and your terminal will be fixed!** 🚀

