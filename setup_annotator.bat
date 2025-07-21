@echo off
:: Floor Plan Annotation Setup Script - For NoirPrimordial7

echo ============================================
echo     🏗 Floor Planner Annotation Setup
echo ============================================

:: 1. Clone the GitHub repo
echo 🔄 Cloning GitHub repo...
git clone https://github.com/NoirPrimordial7/dataset-floor-planner.git dataset-floor-planner
cd dataset-floor-planner

:: 2. Create virtual environment
echo 🐍 Creating virtual environment...
python -m venv .venv
call .venv\Scripts\activate.bat

:: 3. Install LabelMe
echo 📦 Installing LabelMe...
pip install --upgrade pip
pip install labelme

:: 4. Start LabelMe
echo 🚀 Starting LabelMe with image folder...
labelme images annotations

echo.
echo ✅ Annotation Ready!
echo 💾 Make sure all JSONs are saved in the 'annotations/' folder.
echo.
pause
