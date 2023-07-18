# Derive the project name from the current folder path and replace spaces with underscores
$project_name = (Get-Item $PWD).Name -replace ' ', '_'

# Check if virtual environment exists
if (Test-Path "$env:USERPROFILE\.virtualenvs\$project_name") {
    Write-Host "Virtual environment exists"
} else {
    Write-Host "Virtual environment does not exist, creating it now..."
    # If you are using Python3, you should have venv module by default, no need to install virtualenv
    python -m venv "$env:USERPROFILE\.virtualenvs\$project_name"
}

# Activate the existing or created virtual environment
$activateScript = "$env:USERPROFILE\.virtualenvs\$project_name\Scripts\Activate.ps1"
if (Test-Path $activateScript) {
    Write-Host "Activating virtual environment..."
    . $activateScript
} else {
    Write-Host "Failed to find Activate.ps1 script. Make sure the virtual environment is set up correctly."
}

# Check if requirements.txt exists
if (Test-Path "$PWD\requirements.txt") {
    Write-Host "Installing dependencies..."
    python -m pip install -r "$PWD\requirements.txt"
} else {
    Write-Host "requirements.txt does not exist"
}

# Run the Python script below (remove #)
# Write-Host "Running the Python script..."
# python "$PWD/src/data/file.py"
