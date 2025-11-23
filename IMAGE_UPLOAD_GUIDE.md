# 📸 How to Upload Training Photos to Your Website

## Quick Guide

### Step 1: Create Images Folder
```powershell
# Navigate to your website folder
cd "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"

# Create images folder
mkdir images
```

### Step 2: Add Your Photos
1. Copy your training photos to the `images` folder
2. Rename them for easy reference:
   - `training-1.jpg`
   - `training-2.jpg`
   - `training-3.jpg`
   - etc.

### Step 3: Update the HTML

Replace the placeholder divs in `ict-training.html` with actual images.

**Find this (around line 250):**
```html
<!-- Photo 1 - Placeholder -->
<div class="relative group overflow-hidden rounded-xl shadow-lg">
    <div class="aspect-w-16 aspect-h-12 bg-gradient-to-br from-purple-100 to-blue-100 flex items-center justify-center">
        <div class="text-center p-8">
            <i class="fas fa-image text-6xl text-purple-300 mb-4"></i>
            <p class="text-gray-600">Training Photo 1</p>
            <p class="text-sm text-gray-500 mt-2">Upload your image here</p>
        </div>
    </div>
    <div class="absolute inset-0 bg-purple-600 bg-opacity-0 group-hover:bg-opacity-20 transition"></div>
</div>
```

**Replace with:**
```html
<!-- Photo 1 -->
<div class="relative group overflow-hidden rounded-xl shadow-lg">
    <img src="images/training-1.jpg" alt="ICT Training Class" class="w-full h-64 object-cover">
    <div class="absolute inset-0 bg-purple-600 bg-opacity-0 group-hover:bg-opacity-20 transition"></div>
    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/70 to-transparent p-4 opacity-0 group-hover:opacity-100 transition">
        <p class="text-white font-semibold">Cybersecurity Training - 2024</p>
    </div>
</div>
```

### Step 4: Deploy to GitHub

```powershell
# Add images folder
git add images/

# Add updated HTML
git add ict-training.html

# Commit
git commit -m "Add ICT training page with photos"

# Push
git push origin main
```

---

## 🎨 Image Best Practices

### Image Size & Format
- **Format**: JPG or PNG
- **Size**: 1200x800px (recommended)
- **File size**: < 500KB (compress if needed)
- **Aspect ratio**: 3:2 or 4:3

### Compress Images (Free Tools)
- **TinyPNG**: https://tinypng.com/
- **Squoosh**: https://squoosh.app/
- **ImageOptim** (Mac)

### File Naming
```
✅ Good:
- training-cybersecurity-2024.jpg
- networking-class-jan-2025.jpg
- cloud-computing-students.jpg

❌ Bad:
- IMG_1234.jpg
- photo.jpg
- DSC00001.jpg
```

---

## 🚀 Alternative: Use Image Hosting (No Git Upload)

If you don't want to upload images to GitHub, use a free image hosting service:

### Option 1: Imgur (Free, Easy)
1. Go to https://imgur.com/
2. Upload your image
3. Right-click image → "Copy image address"
4. Use that URL in your HTML:
```html
<img src="https://i.imgur.com/ABC123.jpg" alt="Training">
```

### Option 2: Cloudinary (Free, Professional)
1. Sign up at https://cloudinary.com/
2. Upload images
3. Get image URL
4. Use in HTML

### Option 3: GitHub Issues (Free, Unlimited)
1. Go to your GitHub repo
2. Create a new issue
3. Drag & drop image into issue description
4. Copy the generated URL
5. Close the issue (or keep as draft)
6. Use URL in HTML

---

## 📝 Complete Example

Here's a complete photo gallery section with real images:

```html
<!-- Photo Gallery -->
<section class="py-20 px-4 bg-white">
    <div class="max-w-7xl mx-auto">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold mb-4">Past Training Classes</h2>
            <p class="text-xl text-gray-600">
                See our students in action learning cutting-edge technology
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-6">
            <!-- Photo 1 -->
            <div class="relative group overflow-hidden rounded-xl shadow-lg">
                <img src="images/training-1.jpg" alt="Cybersecurity Training" class="w-full h-64 object-cover">
                <div class="absolute inset-0 bg-purple-600 bg-opacity-0 group-hover:bg-opacity-20 transition"></div>
                <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/70 to-transparent p-4 opacity-0 group-hover:opacity-100 transition">
                    <p class="text-white font-semibold">Cybersecurity Training - 2024</p>
                </div>
            </div>

            <!-- Photo 2 -->
            <div class="relative group overflow-hidden rounded-xl shadow-lg">
                <img src="images/training-2.jpg" alt="Network Engineering Class" class="w-full h-64 object-cover">
                <div class="absolute inset-0 bg-purple-600 bg-opacity-0 group-hover:bg-opacity-20 transition"></div>
                <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/70 to-transparent p-4 opacity-0 group-hover:opacity-100 transition">
                    <p class="text-white font-semibold">Network Engineering - 2024</p>
                </div>
            </div>

            <!-- Photo 3 -->
            <div class="relative group overflow-hidden rounded-xl shadow-lg">
                <img src="images/training-3.jpg" alt="Cloud Computing Workshop" class="w-full h-64 object-cover">
                <div class="absolute inset-0 bg-purple-600 bg-opacity-0 group-hover:bg-opacity-20 transition"></div>
                <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/70 to-transparent p-4 opacity-0 group-hover:opacity-100 transition">
                    <p class="text-white font-semibold">Cloud Computing - 2024</p>
                </div>
            </div>
        </div>
    </div>
</section>
```

---

## ✅ Checklist

- [ ] Create `images` folder
- [ ] Add training photos to `images` folder
- [ ] Compress images (< 500KB each)
- [ ] Update `ict-training.html` with image paths
- [ ] Test locally (open HTML file in browser)
- [ ] Commit and push to GitHub
- [ ] Wait 2-3 minutes for deployment
- [ ] Check live site

---

## 🆘 Need Help?

If you have issues, you can:
1. Email me the photos and I'll add them for you
2. Use Imgur and just send me the URLs
3. Contact support

**Easy Mode**: Just upload to Imgur and send me the links! 😊
