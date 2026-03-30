# 🔧 Fix PowerShell Execution Policy Error

## **Your Error**

```
npm : File C:\Program Files\nodejs\npm.ps1 cannot be loaded because 
running scripts is disabled on this system.
```

**This is a PowerShell security policy issue, NOT a Node.js problem.**

---

## **SOLUTION: Enable PowerShell Scripts (2 Minutes)**

### **Option 1: Use Command Prompt Instead (EASIEST)**

Instead of PowerShell, use **Command Prompt (cmd.exe)**:

1. **Open Command Prompt**
   - Press `Windows Key + R`
   - Type: `cmd`
   - Press Enter

2. **Run npm commands**
   ```bash
   npm run dev
   ```

3. **Done!** Your UI will start

---

### **Option 2: Fix PowerShell Execution Policy**

If you want to use PowerShell:

1. **Open PowerShell as Administrator**
   - Right-click PowerShell
   - Click "Run as Administrator"

2. **Run this command**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Type**: `Y` and press Enter

4. **Close and reopen PowerShell**

5. **Now run**
   ```bash
   npm run dev
   ```

---

## **RECOMMENDED: Use Command Prompt**

### **Step 1: Open Command Prompt**
- Press `Windows Key + R`
- Type: `cmd`
- Press Enter

### **Step 2: Navigate to Project**
```bash
cd C:\path\to\your\project
```

Or if already in project:
```bash
cd .
```

### **Step 3: Run Dev Server**
```bash
npm run dev
```

### **Step 4: Open in Browser**
```
Look for: Local: http://localhost:5173
Click it!
```

### **Done!** Your UI opens 🎉

---

## **Why This Happens**

PowerShell has execution policies that prevent running scripts for security reasons. This is a Windows security feature, not a Node.js issue.

**Command Prompt doesn't have this restriction**, so it's the easiest solution.

---

## **Quick Comparison**

| Method | Difficulty | Time |
|--------|-----------|------|
| Use Command Prompt | ⭐ Easy | 1 min |
| Fix PowerShell | ⭐⭐ Medium | 2 min |

---

## **RECOMMENDED STEPS**

1. **Open Command Prompt** (Windows Key + R → cmd → Enter)
2. **Navigate to project** (cd path/to/project)
3. **Run** `npm run dev`
4. **Click** `http://localhost:5173`
5. **Enjoy** your UI! 🎉

---

## **If Command Prompt Doesn't Work**

Try this:

1. **Open Command Prompt as Administrator**
   - Right-click Command Prompt
   - Click "Run as Administrator"

2. **Run**
   ```bash
   npm run dev
   ```

---

## **Still Having Issues?**

Try this alternative:

1. **Open Command Prompt**
2. **Run**
   ```bash
   node frontend/src/main.tsx
   ```

Or:

```bash
npx vite
```

---

## **Your UI Will Be At**

Once you run `npm run dev`:

```
http://localhost:5173
```

This is a **local URL** on your computer. Only you can access it.

---

## **To Share Your UI Online**

You would need to:
1. Deploy to Vercel (requires GitHub connection)
2. Deploy to Netlify
3. Deploy to AWS
4. Deploy to another hosting service

But for now, you can view it locally at `http://localhost:5173`

---

## **NEXT STEPS**

1. **Open Command Prompt** (Windows Key + R → cmd → Enter)
2. **Navigate to project**
3. **Run** `npm run dev`
4. **Click** `http://localhost:5173`
5. **Your UI opens!** 🎉

---

**Use Command Prompt and your terminal will work!** ✅

