# ⚡ Quick Fix: PowerShell Execution Policy

## **Your Problem**

PowerShell won't run npm commands due to execution policy.

## **Solution: Use Command Prompt Instead**

### **Step 1: Open Command Prompt**
```
Windows Key + R
Type: cmd
Press Enter
```

### **Step 2: Navigate to Project**
```bash
cd C:\path\to\your\project
```

### **Step 3: Run Dev Server**
```bash
npm run dev
```

### **Step 4: Open in Browser**
```
Click: http://localhost:5173
```

### **Done!** Your UI opens 🎉

---

## **That's It!**

Command Prompt doesn't have PowerShell's execution policy restrictions.

Your UI will be at: `http://localhost:5173`

---

**Use Command Prompt and it will work!** ✅

