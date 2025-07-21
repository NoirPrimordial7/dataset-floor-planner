@echo off
:: Floor Plan Annotation Setup Script

:: 1. Clone the GitHub repo
echo Cloning the dataset repo...
git clone https://github.com/NoirPrimordial7/dataset-floor-planner.git dataset

cd dataset

:: 2. Create a virtual environment (optional but clean)
echo Creating virtual environment...
python -m venv .venv
call .venv\Scripts\activate.bat

:: 3. Install LabelMe
echo Installing LabelMe...
pip install --upgrade pip
pip install labelme

:: 4. Launch LabelMe with image folder
echo Launching LabelMe...
labelme images annotations

:: Reminder
echo.
echo --------------------------------------
echo 💾 REMINDER: Save your JSONs in /annotations/
echo 🧾 You are annotating %USERNAME%'s batch
echo --------------------------------------
pause
