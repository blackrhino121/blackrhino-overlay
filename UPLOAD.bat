@echo off
echo.
echo  ===========================================
echo   UPLOAD TO GITHUB PAGES
echo  ===========================================
echo.
echo  This script helps upload your overlay to GitHub.
echo.
echo  BEFORE RUNNING:
echo  1. Install Git from https://git-scm.com/download/win
echo  2. Create a GitHub account at https://github.com
echo  3. Create a new repository named "blackrhino-overlay"
echo  4. Copy the repository URL
echo.
echo  Press any key to continue...
pause >nul

echo.
echo  Enter your GitHub repository URL:
echo  (Example: https://github.com/YourName/blackrhino-overlay.git)
set /p repoURL="> "

echo.
echo  Initializing Git repository...
git init

echo.
echo  Adding files...
git add .

echo.
echo  Committing...
git commit -m "Initial overlay upload"

echo.
echo  Setting remote...
git remote add origin %repoURL%

echo.
echo  Pushing to GitHub...
git push -u origin main

echo.
echo  ===========================================
echo   UPLOAD COMPLETE!
echo  ===========================================
echo.
echo  Now:
echo  1. Go to your GitHub repository
echo  2. Click Settings ^> Pages
echo  3. Set Source to "main" branch
echo  4. Wait 2-3 minutes
echo  5. Your overlay URL will be shown
.
echo.
pause
