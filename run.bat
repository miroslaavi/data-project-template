@echo off

REM Define the name of the project to a variable
set project_name=project_name

REM Check if virtual environment exists
if exist %USERPROFILE%\.virtualenvs\%project_name% (
    echo Virtual environment exists
) else (
    echo Virtual environment does not exist, creating it now...
    REM If you are using Python3, you should have venv module by default, no need to install virtualenv
    python -m venv %USERPROFILE%\.virtualenvs\%project_name%
)

REM Activate the existing or created virtual environment
call %USERPROFILE%\.virtualenvs\%project_name%\Scripts\activate.bat

REM Check if requirements.txt exists
if exist "%CD%\requirements.txt" (
    echo Installing dependencies...
    python -m pip install -r "%CD%\requirements.txt"
) else (
    echo requirements.txt does not exist
)