# ⚡ Quick Command Reference

## **Copy & Paste These Commands**

### **Step 1: Open Command Prompt**
```
Windows Key + R
Type: cmd
Press Enter
```

---

### **Step 2: Try These Commands (in order)**

**Try Command 1:**
```bash
cd Documents\WEB3
npm run dev
```

**If that doesn't work, try Command 2:**
```bash
cd Desktop\WEB3
npm run dev
```

**If that doesn't work, try Command 3:**
```bash
cd WEB3
npm run dev
```

**If that doesn't work, try Command 4:**
```bash
cd vault-omni-protocol
npm run dev
```

---

### **Step 3: When You See This**

```
VITE v4.x.x  ready in xxx ms

➜  Local:   http://localhost:5173/
```

**Your UI is ready!**

---

### **Step 4: Open Your Browser**

Go to:
```
http://localhost:5173
```

**Your UI opens!** 🎉

---

## **If None of Those Work**

### **Find Your Project Path**

In Command Prompt, type:
```bash
dir C:\Users\snowe\
```

Look for a folder named:
- `WEB3`
- `vault-omni-protocol`
- `web3`
- `project`

Once you find it, navigate there:
```bash
cd C:\Users\snowe\[FOLDER_NAME]
npm run dev
```

---

## **Verify You're in the Right Place**

Before running `npm run dev`, type:
```bash
dir
```

You should see:
```
frontend/
backend/
contracts/
package.json
```

If you see these, you're good! Run:
```bash
npm run dev
```

---

## **Your UI Location**

Once running:
```
http://localhost:5173
```

This is your local UI. Only you can see it.

---

## **Stop the Server**

In Command Prompt, press:
```
Ctrl + C
```

---

## **Run Again Later**

Just repeat:
```bash
cd [your project path]
npm run dev
```

Then go to `http://localhost:5173`

---

## **That's It!**

You now have everything you need to run your UI locally.

**Let's go!** 🚀
