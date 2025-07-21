@echo off
title 🚀 Smart Annotation Sync - Floor Planner

echo ============================================
echo        📤 Floor Planner - Annotation Sync
echo ============================================

:: ----------- GIT INSTALL CHECK -----------
echo 🔍 Checking for Git...
where git >nul 2>nul
if errorlevel 1 (
    echo ❌ Git not found. Installing Git...
    powershell -Command "Start-Process 'https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe' -Wait"
    echo 🔁 Please re-run this script after Git is installed.
    pause
    exit /b
) else (
    echo ✅ Git is installed.
)

:: ----------- GH CLI CHECK -----------
echo 🔍 Checking for GitHub CLI...
where gh >nul 2>nul
if errorlevel 1 (
    echo ❌ GitHub CLI not found. Installing...
    powershell -Command "Start-Process 'https://github.com/cli/cli/releases/download/v2.50.0/gh_2.50.0_windows_amd64.msi' -Wait"
    echo 🔁 Please re-run this script after GitHub CLI is installed.
    pause
    exit /b
) else (
    echo ✅ GitHub CLI is installed.
)

:: ----------- GH LOGIN -----------
echo 🔐 Checking GitHub login...
gh auth status >nul 2>&1
if errorlevel 1 (
    echo 🔑 Logging in to GitHub...
    gh auth login
) else (
    echo ✅ Already authenticated with GitHub.
)

:: ----------- MOVE TO REPO -----------
cd dataset-floor-planner

:: Optional: Activate Python venv
call .venv\Scripts\activate.bat >nul 2>&1

:: ----------- SYNC BEFORE PUSH -----------
echo 🔄 Pulling latest changes...
git pull origin main

:: ----------- COMMIT ONLY CHANGED JSONs -----------
echo 📝 Adding changed JSON files from /annotations...
git add -u annotations\*.json

:: Commit only if there are changes
git diff --cached --quiet
if errorlevel 1 (
    set timestamp=%date% %time%
    git commit -m "📌 %USERNAME% updated annotations @ %timestamp%"
    echo ⬆️ Pushing to GitHub...
    git push origin main

    :: Log it locally
    echo %USERNAME% pushed on %date% at %time% >> annotation_push_log.txt

    echo ✅ Annotations pushed and logged successfully.
) else (
    echo ⚠️ No new changes to commit.
)

pause
