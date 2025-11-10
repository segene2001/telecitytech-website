# GoDaddy Website Builder - Migration Guide

## ⚠️ Important: Website Builder vs Traditional Hosting

**GoDaddy Website Builder** is a drag-and-drop tool that **CANNOT** use custom HTML files directly.

Your custom HTML website needs **traditional web hosting** (cPanel/FTP access).

---

## 🔍 Check What You Have

1. Login to GoDaddy
2. Go to "My Products"
3. Look for your telecitytech.com service

**You have Website Builder if you see:**
- "Website Builder"
- "GoCentral"
- "Websites + Marketing"
- Drag-and-drop editor

**You have Traditional Hosting if you see:**
- "Web Hosting"
- "cPanel Hosting"
- "Linux Hosting"
- "WordPress Hosting"
- File Manager or cPanel access

---

## ✅ Solution 1: Upgrade to Traditional Hosting (Recommended)

### Step 1: Purchase Web Hosting

1. Go to GoDaddy
2. Search for "Web Hosting" or "cPanel Hosting"
3. Choose a plan (Economy plan is sufficient - ~$5-10/month)
4. Complete purchase

### Step 2: Point Domain to New Hosting

1. In GoDaddy, go to "My Products"
2. Find your new hosting account
3. Click "Set Up" or "Manage"
4. Follow prompts to assign telecitytech.com to this hosting
5. Wait 1-24 hours for DNS propagation

### Step 3: Upload Your Website

Once hosting is active:
1. Access cPanel or File Manager
2. Go to `public_html` folder
3. Upload your HTML files:
   - index.html
   - services.html
   - contact.html
   - css/ folder
   - js/ folder

### Step 4: Test

Visit https://telecitytech.com - your new site should appear!

**Cost:** ~$60-120/year for hosting

---

## ✅ Solution 2: Use Netlify (Free & Easy)

Instead of paying GoDaddy for hosting, use Netlify (free, better performance):

### Step 1: Deploy to Netlify

1. Go to https://netlify.com
2. Sign up (free account)
3. Click "Add new site" → "Deploy manually"
4. Drag and drop your `telecitytech-website` folder
5. Wait for deployment (takes 30 seconds)
6. You'll get a URL like: `your-site.netlify.app`

### Step 2: Add Custom Domain

1. In Netlify, go to "Domain settings"
2. Click "Add custom domain"
3. Enter: `telecitytech.com`
4. Netlify will give you DNS records

### Step 3: Update DNS in GoDaddy

1. Go to GoDaddy → My Products → Domains
2. Find telecitytech.com → Click "DNS"
3. Update these records (Netlify will tell you exact values):

**A Record:**
```
Type: A
Name: @
Value: 75.2.60.5 (Netlify's IP)
TTL: 1 Hour
```

**CNAME Record:**
```
Type: CNAME
Name: www
Value: your-site.netlify.app
TTL: 1 Hour
```

4. Save changes
5. Wait 1-24 hours for DNS propagation

### Step 4: Enable SSL in Netlify

1. In Netlify → Domain settings
2. Scroll to "HTTPS"
3. Click "Verify DNS configuration"
4. Click "Provision certificate"
5. Wait a few minutes - SSL will be active

**Cost:** FREE! ✨

**Benefits:**
- ✅ Free hosting
- ✅ Free SSL certificate
- ✅ Automatic deployments
- ✅ Better performance than GoDaddy
- ✅ Easy updates (drag & drop)

---

## ✅ Solution 3: Keep Website Builder (Manual Recreation)

If you want to keep using GoDaddy Website Builder, you'll need to manually recreate the design:

### Pros:
- No hosting change needed
- Familiar drag-and-drop interface

### Cons:
- ❌ Time-consuming to recreate
- ❌ Less control over design
- ❌ Can't use custom HTML/CSS/JS
- ❌ Limited features
- ❌ Slower performance

### How to Do It:

1. Open GoDaddy Website Builder editor
2. Create new pages:
   - Home
   - Services
   - Contact
   - About
   - AI Initiative

3. Manually add content:
   - Copy text from HTML files
   - Recreate layout with builder blocks
   - Add images
   - Style with builder tools

4. Publish when done

**Time Required:** 4-8 hours of manual work

---

## 🎯 Recommended Path

### For Best Results:

**Option A: Use Netlify (FREE)**
- Best performance
- Free SSL
- Easy updates
- Professional hosting
- Takes 30 minutes to set up

**Option B: Upgrade GoDaddy Hosting**
- Keep everything with GoDaddy
- More expensive (~$60-120/year)
- Traditional cPanel hosting
- Upload HTML directly

**Option C: Keep Website Builder**
- Only if you want drag-and-drop
- Requires manual recreation
- Less flexible
- Not recommended for custom designs

---

## 📋 Quick Comparison

| Feature | Website Builder | GoDaddy Hosting | Netlify |
|---------|----------------|-----------------|---------|
| **Cost** | Included | $60-120/year | FREE |
| **Custom HTML** | ❌ No | ✅ Yes | ✅ Yes |
| **Performance** | Slow | Medium | Fast |
| **SSL** | Included | Extra cost | FREE |
| **Updates** | Drag-drop | FTP/File Manager | Drag-drop |
| **Control** | Limited | Full | Full |
| **Recommended** | ❌ | ⚠️ OK | ✅ Best |

---

## 🚀 Step-by-Step: Netlify Deployment (Recommended)

### 1. Prepare Your Files

Your files are ready at:
```
C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\
```

### 2. Sign Up for Netlify

1. Go to https://netlify.com
2. Click "Sign up"
3. Use email or GitHub account
4. Verify email

### 3. Deploy Website

1. Click "Add new site"
2. Choose "Deploy manually"
3. Drag the `telecitytech-website` folder
4. Drop it in the upload area
5. Wait 30 seconds
6. Your site is live! (at temporary URL)

### 4. Add Custom Domain

1. Click "Domain settings"
2. Click "Add custom domain"
3. Enter: `telecitytech.com`
4. Click "Verify"
5. Netlify shows DNS instructions

### 5. Update GoDaddy DNS

1. Login to GoDaddy
2. My Products → Domains
3. Find telecitytech.com
4. Click "DNS" or "Manage DNS"
5. Add/Update these records:

**Delete existing A records for @**

**Add new A record:**
```
Type: A
Name: @
Value: 75.2.60.5
TTL: 1 Hour
```

**Update/Add CNAME:**
```
Type: CNAME  
Name: www
Value: [your-site-name].netlify.app
TTL: 1 Hour
```

6. Save changes

### 6. Wait for DNS Propagation

- Usually takes 1-4 hours
- Can take up to 24 hours
- Check status: https://dnschecker.org

### 7. Enable SSL

1. Back in Netlify → Domain settings
2. Scroll to "HTTPS"
3. Click "Verify DNS configuration"
4. Click "Provision certificate"
5. Wait 5-10 minutes
6. SSL active! 🔒

### 8. Test Your Site

Visit https://telecitytech.com
- Should show your new design
- Green padlock (SSL)
- Fast loading

---

## 🔧 Troubleshooting

### "Domain already in use"

**Problem:** GoDaddy Website Builder is still using the domain

**Solution:**
1. In GoDaddy, find Website Builder
2. Click "Manage"
3. Remove or disconnect telecitytech.com
4. Then update DNS as shown above

### "DNS not propagating"

**Problem:** Still seeing old site after 24 hours

**Solution:**
1. Check DNS with: https://dnschecker.org
2. Verify A record points to: 75.2.60.5
3. Clear browser cache (Ctrl+Shift+Delete)
4. Try incognito/private window
5. Contact GoDaddy support to verify DNS changes

### "SSL not working"

**Problem:** Certificate won't provision

**Solution:**
1. Verify DNS is fully propagated
2. Wait 24 hours after DNS change
3. Try "Provision certificate" again
4. Check Netlify support docs

---

## 📞 Need Help?

### Netlify Support
- Docs: https://docs.netlify.com
- Community: https://answers.netlify.com
- Support: support@netlify.com

### GoDaddy Support
- Phone: Check your account
- Chat: Available 24/7
- Help: https://godaddy.com/help

### Website Issues
- Email: ofatokun@telecitytech.com

---

## ✅ Final Recommendation

**Use Netlify!** Here's why:

1. **FREE** - Save $60-120/year
2. **Faster** - Better performance than GoDaddy
3. **Easier** - Drag & drop updates
4. **Professional** - Used by major companies
5. **Secure** - Free SSL certificate
6. **Reliable** - 99.9% uptime

You keep your domain at GoDaddy (just update DNS), but host the actual website on Netlify.

**Total time:** 30 minutes setup + 1-24 hours DNS propagation

---

**Last Updated:** November 9, 2025  
**Your Website:** telecitytech.com  
**Project Location:** `C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\`
