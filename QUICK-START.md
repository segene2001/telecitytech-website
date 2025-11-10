# 🚀 Quick Start - Deploy to GitHub Pages

## Super Fast Deployment (5 Minutes)

### Step 1: Run Deployment Script

1. Open File Explorer
2. Navigate to: `C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\`
3. Double-click: `deploy-to-github.bat`
4. Enter your GitHub username when prompted
5. Enter your GitHub password when prompted

**The script will:**
- Initialize Git repository
- Add all your files
- Create CNAME file
- Push to GitHub

---

### Step 2: Enable GitHub Pages

1. Go to: `https://github.com/YOUR_USERNAME/telecitytech-website`
2. Click **Settings** (top right)
3. Click **Pages** (left sidebar)
4. Under "Source":
   - Branch: **main**
   - Folder: **/ (root)**
   - Click **Save**
5. Under "Custom domain":
   - Enter: **telecitytech.com**
   - Click **Save**

---

### Step 3: Update GoDaddy DNS

1. Login to GoDaddy: https://godaddy.com
2. Go to: **My Products** → **Domains**
3. Click **DNS** next to telecitytech.com
4. **Delete** old A records for `@`
5. **Add these 4 A records:**

```
Type: A, Name: @, Value: 185.199.108.153, TTL: 1 Hour
Type: A, Name: @, Value: 185.199.109.153, TTL: 1 Hour
Type: A, Name: @, Value: 185.199.110.153, TTL: 1 Hour
Type: A, Name: @, Value: 185.199.111.153, TTL: 1 Hour
```

6. **Update CNAME record for www:**

```
Type: CNAME, Name: www, Value: YOUR_USERNAME.github.io, TTL: 1 Hour
```

7. Click **Save**

---

### Step 4: Wait & Verify

**Wait:** 1-4 hours for DNS propagation

**Check DNS:** https://dnschecker.org
- Enter: telecitytech.com
- Should show GitHub's IPs

**Test your site:**
- https://telecitytech.com ✅
- https://www.telecitytech.com ✅

---

## ✅ Done!

Your website is now live on GitHub Pages with your custom domain!

**Cost:** FREE (just your domain registration)

---

## 🔄 To Update Your Website Later

### Option 1: Edit on GitHub
1. Go to your repository
2. Click on file to edit
3. Click pencil icon
4. Make changes
5. Commit changes
6. Live in 1-2 minutes!

### Option 2: Push from Computer
```bash
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"
# Make your changes to files
git add .
git commit -m "Update website"
git push
```

---

## 📞 Need Help?

See detailed guide: `GITHUB-PAGES-DEPLOYMENT.md`

Email: ofatokun@telecitytech.com

---

**That's it! 🎉**
