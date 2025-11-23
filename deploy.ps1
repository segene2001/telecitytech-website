# Quick Deploy Script for Telecity Tech Website
# Deploys to GitHub Pages (telecitytech.com)

Write-Host "`n🚀 Deploying Telecity Tech Website to GitHub Pages..." -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan

# Navigate to website folder
Set-Location "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"

# Show current status
Write-Host "`n📝 Changes to deploy:" -ForegroundColor Cyan
git status --short

# Confirm deployment
Write-Host "`n" -NoNewline
$confirm = Read-Host "Deploy these changes? (Y/n)"
if ($confirm -eq 'n' -or $confirm -eq 'N') {
    Write-Host "❌ Deployment cancelled." -ForegroundColor Yellow
    exit
}

# Add all changes
Write-Host "`n📦 Staging files..." -ForegroundColor Cyan
git add .

# Commit with descriptive message
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = @"
Add AfriHealth Sentinel Public Health Initiative

- Created public-health-initiative.html with full case study
- Added featured section to homepage (index.html)
- Updated navigation menu (desktop + mobile)
- Added DHIS2 comparison section
- Changed Partners to Target Partners (seeking partnerships)
- Consistent design with AI Initiative page

Deployed: $timestamp
"@

Write-Host "💬 Committing changes..." -ForegroundColor Cyan
git commit -m $commitMessage

# Push to GitHub
Write-Host "`n📤 Pushing to GitHub..." -ForegroundColor Cyan
git push origin main

# Success message
Write-Host "`n✅ Successfully deployed to GitHub!" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan

Write-Host "`n🌐 Your website will be live in 2-3 minutes at:" -ForegroundColor Yellow
Write-Host "   • Homepage: https://telecitytech.com/" -ForegroundColor White
Write-Host "   • Public Health: https://telecitytech.com/public-health-initiative.html" -ForegroundColor White
Write-Host "   • AI Initiative: https://telecitytech.com/ai-initiative.html" -ForegroundColor White

Write-Host "`n💡 Tips:" -ForegroundColor Cyan
Write-Host "   • Hard refresh browser: Ctrl+Shift+R" -ForegroundColor Gray
Write-Host "   • Check deployment: https://github.com/YOUR_USERNAME/telecitytech-website/actions" -ForegroundColor Gray
Write-Host "   • Clear cache if changes don't show" -ForegroundColor Gray

Write-Host "`nDeployment complete!" -ForegroundColor Green
Write-Host ""
