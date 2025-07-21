@echo off
cd dataset-floor-planner
call .venv\Scripts\activate.bat
labelme labelme\assignment\R1bbo annotations --labels labelme\labels.txt
