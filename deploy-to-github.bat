@echo off
echo ========================================
echo Telecity Technologies - GitHub Deployment
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo Git is installed. Proceeding...
echo.

REM Prompt for GitHub username
set /p GITHUB_USERNAME="Enter your GitHub username: "

echo.
echo ========================================
echo Step 1: Initializing Git Repository
echo ========================================
git init

echo.
echo ========================================
echo Step 2: Adding all files
echo ========================================
git add .

echo.
echo ========================================
echo Step 3: Creating initial commit
echo ========================================
git commit -m "Initial commit - Telecity Technologies website"

echo.
echo ========================================
echo Step 4: Adding GitHub remote
echo ========================================
git remote add origin https://github.com/%GITHUB_USERNAME%/telecitytech-website.git

echo.
echo ========================================
echo Step 5: Creating CNAME file
echo ========================================
echo telecitytech.com > CNAME
git add CNAME
git commit -m "Add CNAME for custom domain"

echo.
echo ========================================
echo Step 6: Pushing to GitHub
echo ========================================
echo You will be prompted for your GitHub credentials...
echo.
git branch -M main
git push -u origin main

echo.
echo ========================================
echo SUCCESS! Files pushed to GitHub
echo ========================================
echo.
echo Next steps:
echo 1. Go to: https://github.com/%GITHUB_USERNAME%/telecitytech-website
echo 2. Click Settings ^> Pages
echo 3. Set Source to: main branch, / (root)
echo 4. Add custom domain: telecitytech.com
echo 5. Update DNS in GoDaddy (see GITHUB-PAGES-DEPLOYMENT.md)
echo.
echo DNS Records to add in GoDaddy:
echo --------------------------------
echo A Record: @ ^> 185.199.108.153
echo A Record: @ ^> 185.199.109.153
echo A Record: @ ^> 185.199.110.153
echo A Record: @ ^> 185.199.111.153
echo CNAME: www ^> %GITHUB_USERNAME%.github.io
echo.
pause
