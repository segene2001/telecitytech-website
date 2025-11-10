@echo off
echo ========================================
echo Telecity Technologies - GitHub Setup
echo ========================================
echo.
echo IMPORTANT: Before running this script:
echo 1. Go to https://github.com
echo 2. Click + (top right) ^> New repository
echo 3. Name: telecitytech-website
echo 4. Make it PUBLIC
echo 5. DO NOT add README, .gitignore, or license
echo 6. Click "Create repository"
echo.
echo Have you created the repository on GitHub? (Y/N)
set /p CREATED="Enter Y when ready: "

if /i not "%CREATED%"=="Y" (
    echo.
    echo Please create the repository first, then run this script again.
    pause
    exit /b 1
)

echo.
set /p GITHUB_USERNAME="Enter your GitHub username: "

echo.
echo ========================================
echo Initializing Git...
echo ========================================
git init

echo.
echo ========================================
echo Adding files...
echo ========================================
git add .

echo.
echo ========================================
echo Creating commit...
echo ========================================
git commit -m "Initial commit - Telecity Technologies website"

echo.
echo ========================================
echo Creating CNAME file...
echo ========================================
echo telecitytech.com > CNAME
git add CNAME
git commit -m "Add CNAME for custom domain"

echo.
echo ========================================
echo Setting up remote...
echo ========================================
git remote add origin https://github.com/%GITHUB_USERNAME%/telecitytech-website.git

echo.
echo ========================================
echo Pushing to GitHub...
echo ========================================
echo.
echo You may be prompted for your GitHub credentials.
echo If you have 2FA enabled, use a Personal Access Token as password.
echo.
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ========================================
    echo ERROR: Push failed!
    echo ========================================
    echo.
    echo Common issues:
    echo 1. Repository doesn't exist - create it on GitHub first
    echo 2. Wrong username - check spelling
    echo 3. Authentication failed - check password/token
    echo 4. Repository already has content - delete and recreate it
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Code pushed to GitHub!
echo ========================================
echo.
echo Repository: https://github.com/%GITHUB_USERNAME%/telecitytech-website
echo.
echo NEXT STEPS:
echo ========================================
echo 1. Go to: https://github.com/%GITHUB_USERNAME%/telecitytech-website
echo 2. Click "Settings" tab
echo 3. Click "Pages" in left sidebar
echo 4. Under "Source":
echo    - Branch: main
echo    - Folder: / (root)
echo    - Click Save
echo 5. Under "Custom domain":
echo    - Enter: telecitytech.com
echo    - Click Save
echo.
echo 6. Update DNS in GoDaddy:
echo    --------------------------------
echo    Add these A records for @:
echo    - 185.199.108.153
echo    - 185.199.109.153
echo    - 185.199.110.153
echo    - 185.199.111.153
echo.
echo    Add CNAME for www:
echo    - %GITHUB_USERNAME%.github.io
echo.
echo Press any key to open your repository in browser...
pause
start https://github.com/%GITHUB_USERNAME%/telecitytech-website
