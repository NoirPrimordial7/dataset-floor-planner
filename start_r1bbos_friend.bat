@echo off
cd dataset-floor-planner
call .venv\Scripts\activate.bat
labelme "labelme\assignment\R1bbos Friend" annotations --labels labelme\labels.txt
