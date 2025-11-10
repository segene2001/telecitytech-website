# GitHub Pages Deployment Guide

## 🚀 Deploy telecitytech.com to GitHub Pages

### Prerequisites
- ✅ GitHub account
- ✅ Git installed on your computer
- ✅ Your website files ready

---

## Step 1: Create GitHub Repository

1. **Go to GitHub**
   - Visit https://github.com
   - Sign in to your account

2. **Create New Repository**
   - Click the "+" icon (top right)
   - Select "New repository"

3. **Repository Settings**
   - **Name:** `telecitytech-website` (or `telecitytech.com`)
   - **Description:** "Official website for Telecity Technologies"
   - **Visibility:** Public (required for free GitHub Pages)
   - **DO NOT** initialize with README
   - Click "Create repository"

---

## Step 2: Push Your Website to GitHub

Open Command Prompt or PowerShell and run these commands:

### Navigate to Your Project
```bash
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"
```

### Initialize Git Repository
```bash
git init
```

### Add All Files
```bash
git add .
```

### Commit Files
```bash
git commit -m "Initial commit - Telecity Technologies website"
```

### Add GitHub Remote
Replace `YOUR_USERNAME` with your actual GitHub username:
```bash
git remote add origin https://github.com/YOUR_USERNAME/telecitytech-website.git
```

### Push to GitHub
```bash
git branch -M main
git push -u origin main
```

**Enter your GitHub credentials when prompted**

---

## Step 3: Enable GitHub Pages

1. **Go to Your Repository**
   - Visit: `https://github.com/YOUR_USERNAME/telecitytech-website`

2. **Open Settings**
   - Click "Settings" tab (top right)

3. **Navigate to Pages**
   - Scroll down left sidebar
   - Click "Pages"

4. **Configure Source**
   - **Source:** Deploy from a branch
   - **Branch:** main
   - **Folder:** / (root)
   - Click "Save"

5. **Wait for Deployment**
   - Takes 1-3 minutes
   - Refresh the page
   - You'll see: "Your site is live at https://YOUR_USERNAME.github.io/telecitytech-website/"

6. **Test Temporary URL**
   - Click the URL to verify your site works

---

## Step 4: Add Custom Domain

### In GitHub:

1. **Still in Pages Settings**
   - Find "Custom domain" section
   - Enter: `telecitytech.com`
   - Click "Save"

2. **Wait for DNS Check**
   - GitHub will verify DNS (will fail initially - that's OK)
   - We'll fix this in the next step

3. **Enable HTTPS**
   - Check the box "Enforce HTTPS"
   - (May need to wait until DNS is configured)

---

## Step 5: Update DNS in GoDaddy

### Login to GoDaddy

1. Go to https://godaddy.com
2. Sign in
3. Go to "My Products"
4. Find "Domains"
5. Click "DNS" next to telecitytech.com

### Update DNS Records

#### Delete Old Records (if present):
- Delete any existing A records for `@`
- Delete any existing CNAME for `www`

#### Add New A Records:

Add **FOUR** A records pointing to GitHub's IP addresses:

**A Record 1:**
```
Type: A
Name: @
Value: 185.199.108.153
TTL: 1 Hour
```

**A Record 2:**
```
Type: A
Name: @
Value: 185.199.109.153
TTL: 1 Hour
```

**A Record 3:**
```
Type: A
Name: @
Value: 185.199.110.153
TTL: 1 Hour
```

**A Record 4:**
```
Type: A
Name: @
Value: 185.199.111.153
TTL: 1 Hour
```

#### Add CNAME Record:

**CNAME for www:**
```
Type: CNAME
Name: www
Value: YOUR_USERNAME.github.io
TTL: 1 Hour
```

Replace `YOUR_USERNAME` with your actual GitHub username.

### Save Changes

Click "Save" or "Save All Changes"

---

## Step 6: Create CNAME File in Repository

This tells GitHub which domain to use.

### Option A: Via GitHub Website

1. Go to your repository on GitHub
2. Click "Add file" → "Create new file"
3. Name it: `CNAME` (all caps, no extension)
4. Content: `telecitytech.com` (just this, nothing else)
5. Click "Commit new file"

### Option B: Via Command Line

In your project folder:

```bash
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"
echo telecitytech.com > CNAME
git add CNAME
git commit -m "Add CNAME for custom domain"
git push
```

---

## Step 7: Wait for DNS Propagation

- **Time:** 1-24 hours (usually 1-4 hours)
- **Check status:** https://dnschecker.org
- **Enter:** telecitytech.com
- **Look for:** GitHub's IP addresses (185.199.108-111.153)

---

## Step 8: Enable HTTPS

Once DNS is propagated:

1. Go to GitHub repository → Settings → Pages
2. Check "Enforce HTTPS"
3. Wait 5-10 minutes for certificate
4. Your site will be secure! 🔒

---

## Step 9: Verify Everything Works

Visit these URLs and verify they all work:

- ✅ http://telecitytech.com
- ✅ https://telecitytech.com
- ✅ http://www.telecitytech.com
- ✅ https://www.telecitytech.com

All should redirect to: **https://telecitytech.com**

---

## 🔄 How to Update Your Website

Whenever you want to update your website:

### Method 1: Via GitHub Website

1. Go to your repository
2. Navigate to the file you want to edit
3. Click the pencil icon (Edit)
4. Make changes
5. Click "Commit changes"
6. Wait 1-2 minutes - changes are live!

### Method 2: Via Command Line

1. Edit files locally in your project folder
2. Open Command Prompt:

```bash
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"
git add .
git commit -m "Update website content"
git push
```

3. Wait 1-2 minutes - changes are live!

---

## 🎨 Complete File Structure

Your repository should have:

```
telecitytech-website/
├── index.html
├── services.html
├── contact.html
├── about.html (when completed)
├── ai-initiative.html (when completed)
├── css/
│   └── styles.css
├── js/
│   └── main.js
├── CNAME (telecitytech.com)
├── README.md
└── .gitignore (optional)
```

---

## 🔧 Troubleshooting

### Issue: "Domain is already taken"

**Problem:** Another GitHub Pages site is using telecitytech.com

**Solution:**
1. Make sure you own the domain in GoDaddy
2. Verify DNS is pointing to GitHub
3. Wait for DNS propagation
4. Try removing and re-adding custom domain in GitHub

### Issue: "DNS check failed"

**Problem:** GitHub can't verify your DNS

**Solution:**
1. Double-check all 4 A records are correct
2. Verify CNAME record points to YOUR_USERNAME.github.io
3. Wait longer (up to 24 hours)
4. Use https://dnschecker.org to verify propagation
5. Make sure GoDaddy Website Builder is disconnected

### Issue: "HTTPS not available"

**Problem:** Can't enable HTTPS checkbox

**Solution:**
1. DNS must be fully propagated first
2. Wait 24 hours after DNS change
3. Try unchecking and rechecking "Enforce HTTPS"
4. Remove and re-add custom domain

### Issue: "404 Page Not Found"

**Problem:** Site shows 404 error

**Solution:**
1. Verify `index.html` is in root of repository
2. Check GitHub Pages is enabled (Settings → Pages)
3. Verify branch is set to `main` and folder to `/` (root)
4. Wait a few minutes after pushing changes

### Issue: "Styles not loading"

**Problem:** Site shows but no styling

**Solution:**
1. Check `css/styles.css` is in repository
2. Verify path in HTML: `/css/styles.css` or `css/styles.css`
3. Check browser console for errors (F12)
4. Clear browser cache

---

## 📊 DNS Verification Checklist

Use https://dnschecker.org to verify:

**For telecitytech.com (A records):**
- [ ] Shows 185.199.108.153
- [ ] Shows 185.199.109.153
- [ ] Shows 185.199.110.153
- [ ] Shows 185.199.111.153

**For www.telecitytech.com (CNAME):**
- [ ] Points to YOUR_USERNAME.github.io

---

## ✅ Final Checklist

Before considering deployment complete:

- [ ] Repository created on GitHub
- [ ] All files pushed to GitHub
- [ ] GitHub Pages enabled
- [ ] Custom domain added in GitHub
- [ ] CNAME file created
- [ ] 4 A records added in GoDaddy
- [ ] CNAME record added in GoDaddy
- [ ] DNS propagated (check dnschecker.org)
- [ ] HTTPS enabled
- [ ] Site loads at https://telecitytech.com
- [ ] All pages work (home, services, contact)
- [ ] Mobile responsive
- [ ] No console errors

---

## 💰 Cost

**GitHub Pages:** FREE ✨
- Unlimited bandwidth
- Free SSL certificate
- Custom domain support
- Automatic deployments

**GoDaddy Domain:** ~$15-20/year (you already have this)

**Total:** Just your domain cost!

---

## 🎉 Benefits of GitHub Pages

✅ **Free** - No hosting costs
✅ **Fast** - CDN-backed, global distribution
✅ **Reliable** - 99.9% uptime
✅ **Secure** - Free SSL certificate
✅ **Version Control** - Track all changes
✅ **Easy Updates** - Push to deploy
✅ **Professional** - Used by major companies

---

## 📞 Need Help?

### GitHub Support
- Docs: https://docs.github.com/pages
- Community: https://github.community
- Status: https://githubstatus.com

### GoDaddy DNS Support
- Phone: Check your account
- Chat: Available 24/7
- Help: https://godaddy.com/help/dns

### Website Issues
- Email: ofatokun@telecitytech.com

---

## 🔐 Security Best Practices

### Protect Your GitHub Account
1. Enable two-factor authentication (2FA)
2. Use a strong password
3. Review access regularly

### Repository Settings
1. Keep repository public (required for free Pages)
2. Don't commit sensitive data (API keys, passwords)
3. Use .gitignore for local files

### Create .gitignore file:
```
# OS files
.DS_Store
Thumbs.db

# Editor files
.vscode/
.idea/

# Temporary files
*.tmp
*.log

# Local development
node_modules/
.env
```

---

## 📈 Next Steps After Deployment

1. **Add Analytics**
   - Google Analytics
   - Track visitors and behavior

2. **Add Remaining Pages**
   - Complete about.html
   - Add ai-initiative.html

3. **Optimize Performance**
   - Compress images
   - Minify CSS/JS
   - Add meta tags

4. **SEO Optimization**
   - Submit sitemap to Google
   - Add structured data
   - Optimize meta descriptions

5. **Marketing**
   - Share on social media
   - Update business cards
   - Email signature

---

**Deployment Date:** November 9, 2025  
**Website:** telecitytech.com  
**Repository:** github.com/YOUR_USERNAME/telecitytech-website  
**Hosting:** GitHub Pages (FREE)  
**Domain:** GoDaddy  

🚀 **You're all set!**
