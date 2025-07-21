@echo off
title 🚀 Launch LabelMe (Stable Mode)

cd dataset-floor-planner
call .venv\Scripts\activate.bat

:: Launch LabelMe safely
labelme images_rgb

pause
