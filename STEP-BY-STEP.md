# Step-by-Step GitHub Pages Deployment

## 📌 Part 1: Create Repository on GitHub (Do This First!)

### 1. Go to GitHub
- Open browser
- Go to: **https://github.com**
- **Sign in** to your account

### 2. Create New Repository
- Click the **"+"** icon (top right, next to your profile picture)
- Click **"New repository"**

### 3. Fill in the Form

**Repository name:**
```
telecitytech-website
```

**Description (optional):**
```
Official website for Telecity Technologies
```

**Visibility:**
- ✅ Select **Public** (required for free GitHub Pages)

**Initialize repository:**
- ❌ **DO NOT** check "Add a README file"
- ❌ **DO NOT** check "Add .gitignore"  
- ❌ **DO NOT** select a license

### 4. Create Repository
- Click the green **"Create repository"** button
- You'll see a page with setup instructions
- **Keep this page open!**

---

## 📌 Part 2: Push Your Code to GitHub

### Option A: Use the Automated Script (Easiest)

1. **Navigate to your project folder:**
   ```
   C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\
   ```

2. **Double-click:**
   ```
   deploy-step-by-step.bat
   ```

3. **Follow the prompts:**
   - Confirm you created the repository (Y)
   - Enter your GitHub username
   - Enter your password when prompted

4. **Done!** Script will push everything to GitHub

---

### Option B: Manual Commands

1. **Open PowerShell**
   - Right-click in your project folder
   - Select "Open in Terminal" or "Open PowerShell here"

2. **Run these commands one by one:**

```powershell
# Navigate to project folder
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"

# Initialize Git
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit - Telecity Technologies website"

# Create CNAME file for custom domain
echo telecitytech.com > CNAME
git add CNAME
git commit -m "Add CNAME for custom domain"

# Add GitHub remote (replace YOUR_USERNAME with your actual username)
git remote add origin https://github.com/YOUR_USERNAME/telecitytech-website.git

# Push to GitHub
git branch -M main
git push -u origin main
```

3. **Enter credentials when prompted**
   - Username: Your GitHub username
   - Password: Your GitHub password (or Personal Access Token if 2FA is enabled)

---

## 📌 Part 3: Enable GitHub Pages

### 1. Go to Your Repository
- Visit: `https://github.com/YOUR_USERNAME/telecitytech-website`
- You should see all your files there!

### 2. Open Settings
- Click the **"Settings"** tab (top right of repository)

### 3. Navigate to Pages
- In the left sidebar, scroll down
- Click **"Pages"**

### 4. Configure GitHub Pages

**Under "Build and deployment":**

**Source:**
- Select: **Deploy from a branch**

**Branch:**
- Branch: **main**
- Folder: **/ (root)**
- Click **"Save"**

### 5. Add Custom Domain

**Under "Custom domain":**
- Enter: `telecitytech.com`
- Click **"Save"**
- You'll see a DNS check (will show error - that's OK for now)

### 6. Wait for Deployment
- Refresh the page after 1-2 minutes
- You'll see: "Your site is live at https://YOUR_USERNAME.github.io/telecitytech-website/"
- Click the link to test

---

## 📌 Part 4: Update DNS in GoDaddy

### 1. Login to GoDaddy
- Go to: **https://godaddy.com**
- Sign in
- Go to **"My Products"**

### 2. Access DNS Settings
- Find **"Domains"** section
- Find **telecitytech.com**
- Click **"DNS"** or **"Manage DNS"**

### 3. Delete Old Records

**Find and delete:**
- Any existing **A records** for `@` (root domain)
- Any existing **CNAME** for `www` that points to Website Builder

### 4. Add New A Records

Click **"Add"** or **"Add Record"** and add these **FOUR** A records:

**Record 1:**
- Type: `A`
- Name: `@`
- Value: `185.199.108.153`
- TTL: `1 Hour` (or 600)

**Record 2:**
- Type: `A`
- Name: `@`
- Value: `185.199.109.153`
- TTL: `1 Hour`

**Record 3:**
- Type: `A`
- Name: `@`
- Value: `185.199.110.153`
- TTL: `1 Hour`

**Record 4:**
- Type: `A`
- Name: `@`
- Value: `185.199.111.153`
- TTL: `1 Hour`

### 5. Add CNAME Record for www

**Add or update CNAME:**
- Type: `CNAME`
- Name: `www`
- Value: `YOUR_USERNAME.github.io` (replace with your actual GitHub username)
- TTL: `1 Hour`

### 6. Save Changes
- Click **"Save"** or **"Save All Changes"**

---

## 📌 Part 5: Wait for DNS Propagation

### 1. Wait
- DNS changes take **1-24 hours** to propagate
- Usually happens in **1-4 hours**

### 2. Check DNS Status
- Go to: **https://dnschecker.org**
- Enter: `telecitytech.com`
- Select: `A` record type
- You should see GitHub's IP addresses (185.199.108-111.153)

### 3. Check CNAME
- On dnschecker.org
- Enter: `www.telecitytech.com`
- Select: `CNAME` record type
- Should show: `YOUR_USERNAME.github.io`

---

## 📌 Part 6: Enable HTTPS

### 1. Wait for DNS
- DNS must be fully propagated first
- Usually takes a few hours

### 2. Enable HTTPS in GitHub
- Go to: Repository → Settings → Pages
- Scroll to **"Enforce HTTPS"**
- Check the box
- If greyed out, wait longer for DNS

### 3. Wait for Certificate
- GitHub will automatically provision SSL certificate
- Takes 5-10 minutes
- Your site will be secure! 🔒

---

## ✅ Verification Checklist

### Check These URLs:

- [ ] http://telecitytech.com → redirects to https
- [ ] https://telecitytech.com → loads your site ✅
- [ ] http://www.telecitytech.com → redirects to https
- [ ] https://www.telecitytech.com → loads your site ✅

### Check Your Pages:

- [ ] Homepage loads
- [ ] Services page works
- [ ] Contact page works
- [ ] Navigation works
- [ ] Mobile menu works
- [ ] Styles load (purple gradient visible)
- [ ] No console errors (press F12)

---

## 🎉 Success!

Your website is now live at **https://telecitytech.com**!

**Hosting:** GitHub Pages (FREE)  
**Domain:** GoDaddy  
**SSL:** Free Let's Encrypt certificate  
**Cost:** $0/month (just domain registration ~$15/year)

---

## 🔄 How to Update Your Site

### Quick Updates (via GitHub website):
1. Go to your repository
2. Click on the file to edit
3. Click pencil icon (Edit)
4. Make changes
5. Click "Commit changes"
6. Live in 1-2 minutes!

### Local Updates (via Git):
```powershell
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"
# Make your changes to files
git add .
git commit -m "Description of changes"
git push
```
Live in 1-2 minutes!

---

## 🆘 Troubleshooting

### "Repository not found" error
- Make sure you created the repository on GitHub first
- Check the repository name is exactly: `telecitytech-website`
- Verify you're using the correct GitHub username

### "Authentication failed"
- Check your username and password
- If you have 2FA enabled, use a Personal Access Token instead of password
- Create token at: https://github.com/settings/tokens

### "DNS check failed" in GitHub
- Wait longer (up to 24 hours)
- Verify all 4 A records are correct in GoDaddy
- Make sure old Website Builder is disconnected

### Site shows 404
- Wait 2-3 minutes after enabling Pages
- Verify `index.html` is in root of repository
- Check branch is set to `main` and folder to `/`

---

## 📞 Need Help?

**GitHub Docs:** https://docs.github.com/pages  
**GoDaddy Support:** 24/7 chat available  
**Email:** ofatokun@telecitytech.com

---

**Last Updated:** November 10, 2025  
**Your Website:** telecitytech.com  
**Deployment:** GitHub Pages
