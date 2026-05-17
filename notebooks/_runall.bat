@echo off
call C:\Users\sharp\miniforge3\Scripts\activate.bat qss20
cd /d C:\Users\sharp\Documents\GitHub\EGT_project\notebooks
python -m jupyter nbconvert --to notebook --execute --inplace %1
