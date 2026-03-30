# ⚡ Quick Navigation Guide

## **The Problem**

You're in `C:\Users\snowe\` but your project is elsewhere.

## **The Solution**

### **Step 1: Find Your Project Path**

**In Kiro:**
1. Click **File Explorer** (left sidebar)
2. Look at the path at the top
3. This is your project location

**Example paths:**
- `C:\Users\snowe\Documents\WEB3`
- `C:\Users\snowe\Desktop\vault-omni-protocol`
- `C:\Users\snowe\WEB3`

### **Step 2: Open Command Prompt**
```
Windows Key + R
Type: cmd
Press Enter
```

### **Step 3: Navigate to Project**

**If in Documents:**
```bash
cd Documents\WEB3
```

**If on Desktop:**
```bash
cd Desktop\WEB3
```

**If custom location:**
```bash
cd C:\full\path\to\project
```

### **Step 4: Verify**
```bash
dir
```

Should show: `frontend`, `backend`, `contracts`, `package.json`

### **Step 5: Run Dev Server**
```bash
npm run dev
```

### **Step 6: Open Browser**
```
http://localhost:5173
```

**Done!** 🎉

---

## **That's It!**

Navigate to your project folder, then run `npm run dev`.

Your UI opens at `http://localhost:5173`

