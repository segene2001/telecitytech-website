# GoDaddy Deployment Guide for Telecity Technologies

## 📋 Pre-Deployment Checklist

- [ ] Backup current website
- [ ] Test new site locally (http://localhost:8080)
- [ ] Verify all links work
- [ ] Check mobile responsiveness
- [ ] Have GoDaddy login ready

---

## 🚀 Method 1: GoDaddy File Manager (Recommended)

### Step 1: Login to GoDaddy
1. Go to https://godaddy.com
2. Click "Sign In"
3. Enter your credentials
4. Go to "My Products"

### Step 2: Access File Manager
1. Find your hosting account for telecitytech.com
2. Click "Manage" or "cPanel"
3. Look for "File Manager" icon
4. Click to open

### Step 3: Backup Current Site
1. Navigate to `public_html` folder
2. Select all files (Ctrl+A)
3. Click "Compress" or "Zip"
4. Name it: `backup-telecitytech-2025-11-09.zip`
5. Download the zip file to your computer
6. **IMPORTANT:** Keep this backup safe!

### Step 4: Clear Old Files
1. In `public_html`, select all old files
2. **DO NOT DELETE:**
   - `.htaccess` (if present)
   - `cgi-bin` folder
   - Any email-related folders
3. Delete everything else

### Step 5: Upload New Files

#### Upload HTML Files
1. Click "Upload" button
2. Navigate to: `C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\`
3. Select and upload:
   - `index.html`
   - `services.html`
   - `contact.html`

#### Create CSS Folder
1. Click "New Folder"
2. Name it: `css`
3. Open the `css` folder
4. Click "Upload"
5. Upload `styles.css` from your local `css` folder

#### Create JS Folder
1. Go back to `public_html`
2. Click "New Folder"
3. Name it: `js`
4. Open the `js` folder
5. Click "Upload"
6. Upload `main.js` from your local `js` folder

### Step 6: Verify Structure
Your `public_html` should look like:
```
public_html/
├── index.html
├── services.html
├── contact.html
├── css/
│   └── styles.css
├── js/
│   └── main.js
└── .htaccess (if it exists)
```

### Step 7: Test Your Site
1. Open a new browser tab
2. Go to https://telecitytech.com
3. Check:
   - [ ] Homepage loads correctly
   - [ ] Navigation works
   - [ ] Services page works
   - [ ] Contact page works
   - [ ] Mobile view works
   - [ ] All styles load (purple gradient visible)

---

## 🚀 Method 2: FTP Upload (Alternative)

### Step 1: Get FTP Credentials

1. In GoDaddy, go to your hosting account
2. Look for "FTP" or "FTP/SFTP" section
3. Note down:
   - **FTP Hostname:** Usually `ftp.telecitytech.com` or an IP address
   - **Username:** Your FTP username
   - **Password:** Your FTP password (reset if needed)
   - **Port:** 21 (FTP) or 22 (SFTP - more secure)

### Step 2: Download FileZilla

1. Go to https://filezilla-project.org
2. Download FileZilla Client (free)
3. Install on your computer

### Step 3: Connect to GoDaddy

1. Open FileZilla
2. Enter at the top:
   - **Host:** ftp.telecitytech.com (or your hostname)
   - **Username:** [your FTP username]
   - **Password:** [your FTP password]
   - **Port:** 21
3. Click "Quickconnect"

### Step 4: Navigate to Website Root

- **Left Panel:** Your local computer
- **Right Panel:** GoDaddy server

On the right panel:
1. Find and open `public_html` folder
2. This is your website root

### Step 5: Backup Current Site

1. On right panel (server), select all files in `public_html`
2. Right-click → Download
3. Save to a backup folder on your computer

### Step 6: Upload New Files

1. **Left panel:** Navigate to `C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website\`
2. **Right panel:** Make sure you're in `public_html`
3. Delete old files on server (right panel) - keep `.htaccess` if present
4. From left panel, drag and drop to right panel:
   - `index.html`
   - `services.html`
   - `contact.html`
   - `css` folder (entire folder)
   - `js` folder (entire folder)
5. Wait for upload to complete

### Step 7: Verify Upload

- Check right panel shows all files uploaded
- File sizes should match
- Green checkmarks indicate success

### Step 8: Test Website

Visit https://telecitytech.com and verify everything works

---

## 🔧 Troubleshooting

### Issue: Styles Not Loading

**Problem:** Website shows but no purple colors/styling

**Solution:**
1. Check `css/styles.css` uploaded correctly
2. Verify folder name is lowercase: `css` not `CSS`
3. Clear browser cache (Ctrl+Shift+Delete)
4. Check file path in HTML is `/css/styles.css`

### Issue: Links Not Working

**Problem:** Clicking navigation gives 404 errors

**Solution:**
1. Ensure all `.html` files uploaded
2. Check file names are lowercase
3. Verify paths in navigation links
4. May need to add `.html` extension to links

### Issue: Mobile Menu Not Working

**Problem:** Hamburger menu doesn't open on mobile

**Solution:**
1. Verify `js/main.js` uploaded correctly
2. Check browser console for errors (F12)
3. Clear browser cache

### Issue: Contact Form Not Sending

**Problem:** Form submits but no email received

**Solution:**
1. Form needs backend configuration
2. Use Formspree: https://formspree.io
3. Or configure PHP mail on GoDaddy
4. See contact form setup section below

---

## 📧 Setting Up Contact Form

Your contact form currently doesn't have a backend. Here's how to fix it:

### Option A: Formspree (Easiest - Recommended)

1. **Sign up** at https://formspree.io (free plan available)
2. **Create a form** and get your endpoint URL
3. **Update contact.html:**

Open `contact.html` in File Manager, find this line:
```html
<form id="contact-form" class="space-y-6">
```

Change to:
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST" class="space-y-6">
```

4. **Re-upload** `contact.html`
5. **Test** the form

### Option B: GoDaddy Email (PHP)

Create `send-email.php` in File Manager:

```php
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = strip_tags(trim($_POST["name"]));
    $email = filter_var(trim($_POST["email"]), FILTER_SANITIZE_EMAIL);
    $phone = trim($_POST["phone"]);
    $service = trim($_POST["service"]);
    $message = trim($_POST["message"]);
    
    $to = "ofatokun@telecitytech.com";
    $subject = "New Contact Form Submission from $name";
    
    $email_content = "Name: $name\n";
    $email_content .= "Email: $email\n";
    $email_content .= "Phone: $phone\n";
    $email_content .= "Service: $service\n\n";
    $email_content .= "Message:\n$message\n";
    
    $email_headers = "From: $name <$email>";
    
    if (mail($to, $subject, $email_content, $email_headers)) {
        echo "success";
    } else {
        echo "error";
    }
}
?>
```

Then update form action in `contact.html`:
```html
<form action="/send-email.php" method="POST" id="contact-form">
```

---

## 🔒 Security & Performance

### Add/Update .htaccess

Create or edit `.htaccess` in `public_html`:

```apache
# Force HTTPS
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Enable Compression
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript
</IfModule>

# Browser Caching
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType text/css "access plus 1 year"
  ExpiresByType application/javascript "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
</IfModule>

# Security Headers
<IfModule mod_headers.c>
  Header set X-Content-Type-Options "nosniff"
  Header set X-Frame-Options "SAMEORIGIN"
  Header set X-XSS-Protection "1; mode=block"
</IfModule>
```

---

## ✅ Post-Deployment Checklist

After uploading, verify:

- [ ] Homepage loads at https://telecitytech.com
- [ ] All navigation links work
- [ ] Services page displays correctly
- [ ] Contact page loads
- [ ] Mobile responsive (test on phone)
- [ ] Purple gradient theme visible
- [ ] All icons display (Font Awesome)
- [ ] Forms work (if configured)
- [ ] HTTPS is active (padlock in browser)
- [ ] No console errors (F12 → Console)

---

## 📞 Need Help?

If you encounter issues:

1. **Check GoDaddy Support:**
   - Live chat available 24/7
   - Phone: Check your GoDaddy account

2. **Common GoDaddy Help Articles:**
   - "How to upload files via File Manager"
   - "How to use FTP"
   - "How to configure email"

3. **Contact for Website Issues:**
   - Email: ofatokun@telecitytech.com

---

## 🎉 You're Done!

Once everything is uploaded and tested:

1. Share your new website!
2. Update business cards/email signatures
3. Announce on social media
4. Consider adding:
   - Google Analytics
   - Favicon
   - Logo images
   - About page completion
   - AI Initiative page

---

**Last Updated:** November 9, 2025  
**Website:** telecitytech.com  
**Project:** telecitytech-website
