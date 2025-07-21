@echo off
cd dataset-floor-planner
call .venv\Scripts\activate.bat
labelme labelme\assignment\Noir annotations --labels labelme\labels.txt
