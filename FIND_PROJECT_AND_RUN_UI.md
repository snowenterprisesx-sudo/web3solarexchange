# 🎯 Find Your Project & Run Your UI

## **What Went Wrong**

You ran `npm run dev` from `C:\Users\snowe\` but your project files are in a different folder.

npm couldn't find `package.json` because it was looking in the wrong place.

---

## **How to Fix It (5 Minutes)**

### **Step 1: Find Your Project Location**

**In Kiro:**
1. Look at the **File Explorer** (left sidebar)
2. See the path at the top
3. This is your project location

**Example:** `C:\Users\snowe\Documents\WEB3`

### **Step 2: Open Command Prompt**
```
Windows Key + R
Type: cmd
Press Enter
```

### **Step 3: Navigate to Your Project**

**Replace the path with your actual project location:**

```bash
cd C:\Users\snowe\Documents\WEB3
```

Or if it's on Desktop:
```bash
cd C:\Users\snowe\Desktop\WEB3
```

Or if it's in a custom location:
```bash
cd C:\path\to\your\project
```

### **Step 4: Verify You're in the Right Place**

Run:
```bash
dir
```

You should see:
```
frontend/
backend/
contracts/
package.json
README.md
.env.example
```

If you see these, you're in the right place! ✅

### **Step 5: Run Dev Server**

```bash
npm run dev
```

You should see:
```
VITE v4.x.x  ready in xxx ms

➜  Local:   http://localhost:5173/
```

### **Step 6: Open in Browser**

Click the link: `http://localhost:5173`

**Your UI opens!** 🎉

---

## **Finding Your Project Path**

### **Method 1: From Kiro File Explorer**
1. Open Kiro
2. Click **File Explorer** (left sidebar)
3. Look at the breadcrumb path at the top
4. This is your project location
5. Copy it

### **Method 2: From Kiro Terminal**
1. Open Kiro Terminal (`Ctrl + ~`)
2. Run: `pwd`
3. This shows your project directory

### **Method 3: Search Windows**
1. Press `Windows Key`
2. Type: `package.json`
3. Windows finds it
4. Right-click → Open file location
5. This is your project folder

---

## **Common Project Locations**

Try these commands in order:

```bash
# Try 1: WEB3 in Documents
cd Documents\WEB3

# Try 2: vault-omni-protocol in Documents
cd Documents\vault-omni-protocol

# Try 3: WEB3 on Desktop
cd Desktop\WEB3

# Try 4: vault-omni-protocol on Desktop
cd Desktop\vault-omni-protocol

# Try 5: WEB3 in home directory
cd WEB3

# Try 6: vault-omni-protocol in home directory
cd vault-omni-protocol
```

---

## **Step-by-Step Example**

Let's say your project is in `C:\Users\snowe\Documents\WEB3`:

```bash
# 1. Open Command Prompt
Windows Key + R → cmd → Enter

# 2. Navigate to project
cd Documents\WEB3

# 3. Verify you're in the right place
dir

# You should see: frontend, backend, contracts, package.json, etc.

# 4. Run dev server
npm run dev

# 5. You should see:
# VITE v4.x.x  ready in xxx ms
# ➜  Local:   http://localhost:5173/

# 6. Click the link or open browser and go to:
# http://localhost:5173

# Your UI opens! 🎉
```

---

## **Troubleshooting**

### **"No such file or directory"**
- You're in the wrong folder
- Check the path again
- Run `dir` to see what's in current folder
- Navigate to correct location

### **"package.json not found"**
- You're not in the project root
- Look for the folder containing `package.json`
- Navigate there

### **"npm: command not found"**
- Node.js not installed
- Install from https://nodejs.org
- Restart computer

---

## **Your UI Location**

Once you run `npm run dev`, your UI will be at:

```
http://localhost:5173
```

This is a **local URL** on your computer.

---

## **Quick Checklist**

- [ ] Find your project location
- [ ] Open Command Prompt
- [ ] Navigate to project folder
- [ ] Run `dir` to verify `package.json` exists
- [ ] Run `npm run dev`
- [ ] See `Local: http://localhost:5173`
- [ ] Click the link
- [ ] Your UI opens!

---

## **You're Almost There!**

Just navigate to your project folder and run `npm run dev`.

Your UI will open at `http://localhost:5173`

**Let's go!** 🚀

