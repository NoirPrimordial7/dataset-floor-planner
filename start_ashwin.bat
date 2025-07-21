@echo off
cd dataset-floor-planner
call .venv\Scripts\activate.bat
labelme labelme\assignment\Ashwin annotations --labels labelme\labels.txt
