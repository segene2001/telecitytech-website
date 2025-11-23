# Deploy Telecity Tech Website to GitHub Pages
Write-Host "Deploying to telecitytech.com..." -ForegroundColor Green

# Navigate to folder
Set-Location "C:\Users\Olusequn Fatokun\CascadeProjects\telecitytech-website"

# Show changes
Write-Host "`nChanges to deploy:" -ForegroundColor Cyan
git status --short

# Add all
Write-Host "`nStaging files..." -ForegroundColor Cyan
git add .

# Commit
Write-Host "Committing..." -ForegroundColor Cyan
git commit -m "Add AfriHealth Sentinel Public Health Initiative page with DHIS2 comparison"

# Push
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push origin main

# Done
Write-Host "`nDeployment complete!" -ForegroundColor Green
Write-Host "Live in 2-3 minutes at: https://telecitytech.com/public-health-initiative.html" -ForegroundColor Yellow
