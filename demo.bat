@echo off
title 🛠 Floor Planner - Full Setup (Safe)

echo ============================================
echo       🔧 FLOOR PLANNER SETUP STARTED
echo ============================================

:: 1. Check Python
echo 🔍 Checking Python...
where python >nul 2>nul
if errorlevel 1 (
    echo ❌ Python not found. Installing...
    powershell -Command "Start-Process 'https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe' -Wait"
    echo ⚠️ Please install Python and re-run this script.
    pause
    exit /b
)
echo ✅ Python is installed.

:: 2. Check Git
echo 🔍 Checking Git...
where git >nul 2>nul
if errorlevel 1 (
    echo ❌ Git not found. Installing...
    powershell -Command "Start-Process 'https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe' -Wait"
    echo ⚠️ Please install Git and re-run this script.
    pause
    exit /b
)
echo ✅ Git is installed.

:: 3. Clone Repository
echo 🔄 Cloning Floor Planner Dataset Repository...
git clone https://github.com/NoirPrimordial7/dataset-floor-planner.git
cd dataset-floor-planner

:: 4. Setup Python Virtual Environment
echo 🐍 Creating virtual environment...
python -m venv .venv
call .venv\Scripts\activate.bat

:: 5. Clean Install of LabelMe (no onnxruntime)
echo 📦 Installing LabelMe (safe mode)...
pip install --upgrade pip
pip uninstall -y onnxruntime osam >nul 2>nul
pip install labelme==5.2.1

echo.
echo ✅ Setup Complete!
echo ✅ You can now run 'launch_labelme.bat' to start labeling.
pause
