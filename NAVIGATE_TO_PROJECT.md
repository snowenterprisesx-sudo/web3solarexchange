# 🗂️ Navigate to Your Project Directory

## **The Problem**

You ran `npm run dev` from `C:\Users\snowe\` but your project files are elsewhere.

Error message shows:
```
npm error path C:\Users\snowe\package.json
npm error Could not read package.json
```

This means npm is looking for `package.json` in the wrong location.

---

## **The Solution: Find Your Project**

### **Step 1: Find Your Project Location**

Your project is in Kiro. You need to find where it's stored on your computer.

**Common locations:**
- `C:\Users\snowe\Documents\vault-omni-protocol`
- `C:\Users\snowe\Desktop\vault-omni-protocol`
- `C:\Users\snowe\WEB3`
- `C:\Users\snowe\vault-omni-protocol`
- Or wherever you cloned/created it

### **Step 2: Open Command Prompt**
```
Windows Key + R
Type: cmd
Press Enter
```

### **Step 3: Navigate to Project**

**If your project is in Documents:**
```bash
cd Documents\vault-omni-protocol
```

**If your project is on Desktop:**
```bash
cd Desktop\vault-omni-protocol
```

**If your project is in a custom location:**
```bash
cd C:\path\to\your\project
```

**If you're not sure, try:**
```bash
cd WEB3
```

### **Step 4: Verify You're in the Right Place**

Run this command:
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
```

If you see these files, you're in the right place! ✅

### **Step 5: Run Dev Server**
```bash
npm run dev
```

### **Step 6: Open in Browser**
```
Click: http://localhost:5173
```

**Your UI opens!** 🎉

---

## **Finding Your Project in Kiro**

### **Method 1: Check Kiro File Explorer**
1. Click **File Explorer** (left sidebar in Kiro)
2. Look at the path at the top
3. This is your project location
4. Copy this path

### **Method 2: Check Kiro Terminal**
1. Open Kiro Terminal (`Ctrl + ~`)
2. Run: `pwd`
3. This shows your current directory
4. This is your project location

### **Method 3: Look for package.json**
1. In Kiro File Explorer
2. Look for `package.json` file
3. The folder containing it is your project root

---

## **Example: If Your Project is in Documents**

```bash
# Open Command Prompt
Windows Key + R → cmd → Enter

# Navigate to Documents
cd Documents

# List folders
dir

# Find your project folder (e.g., vault-omni-protocol or WEB3)
cd vault-omni-protocol

# Verify you're in the right place
dir

# You should see: frontend, backend, contracts, package.json, etc.

# Run dev server
npm run dev

# Open browser
http://localhost:5173
```

---

## **Quick Checklist**

- [ ] Open Command Prompt
- [ ] Navigate to project directory
- [ ] Run `dir` to verify you see `package.json`
- [ ] Run `npm run dev`
- [ ] See `Local: http://localhost:5173`
- [ ] Click the link
- [ ] Your UI opens!

---

## **If You Still Can't Find It**

### **Option 1: Search Windows**
1. Press `Windows Key`
2. Type: `package.json`
3. Windows will find it
4. Right-click → Open file location
5. This is your project folder

### **Option 2: Check Recent Files**
1. Open File Explorer
2. Click **Recent**
3. Look for your project files
4. Right-click → Open file location

### **Option 3: Check Kiro**
1. In Kiro, click **File Explorer**
2. Look at the breadcrumb path at top
3. This is your project location

---

## **Common Project Locations**

Try these in order:

```bash
# Try 1
cd WEB3

# Try 2
cd vault-omni-protocol

# Try 3
cd Documents\WEB3

# Try 4
cd Documents\vault-omni-protocol

# Try 5
cd Desktop\WEB3

# Try 6
cd Desktop\vault-omni-protocol
```

---

## **After You Find It**

Once you're in the right directory and see `package.json`:

```bash
npm run dev
```

Then open: `http://localhost:5173`

**Your UI opens!** 🎉

---

## **Need Help Finding It?**

1. **Open Kiro**
2. **Look at the file path** in the File Explorer
3. **Copy that path**
4. **Open Command Prompt**
5. **Paste the path** (right-click → paste)
6. **Run** `npm run dev`

---

**Find your project directory and your UI will work!** ✅

