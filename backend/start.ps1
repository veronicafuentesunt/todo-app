# Type this to activate the environment: .\.venv\Scripts\Activate.ps1
# This is to run the server: pwsh ./scripts/start.ps1
# When installing new packages, run: pip freeze > requirements.txt

param(
    [string]$Port = "8000"
)

# Paths
$venvDir = ".\.venv"
$activatePath = ".\.venv\Scripts\Activate.ps1"
$requirementsPath = ".\requirements.txt"

# Ensure venv exists
if (-not (Test-Path $activatePath)) {
    Write-Host "Creating virtual environment..." -ForegroundColor Cyan
    python -m venv $venvDir
}

# Activate venv
Write-Host "Activating virtual environment..." -ForegroundColor Cyan
& $activatePath

# Function to test if a Python module exists
function Test-PyImport($moduleName) {
    $code = "import importlib, sys; sys.exit(0 if importlib.util.find_spec('$moduleName') else 1)"
    python -c $code
    return $LASTEXITCODE -eq 0
}

# Install only if missing
$needsInstall = $false
if (-not (Test-PyImport "django")) { $needsInstall = $true }
if (-not (Test-PyImport "rest_framework")) { $needsInstall = $true }

if ($needsInstall) {
    if (Test-Path $requirementsPath) {
        Write-Host "Installing dependencies from requirements.txt..." -ForegroundColor Cyan
        pip install -r $requirementsPath
    } else {
        Write-Host "Installing required packages..." -ForegroundColor Cyan
        pip install Django djangorestframework
        pip freeze | Out-File $requirementsPath
    }
} else {
    Write-Host "Dependencies already installed. Skipping pip install." -ForegroundColor Green
}

# Apply migrations and run server
Write-Host "Applying migrations..." -ForegroundColor Cyan
python manage.py migrate

Write-Host "Starting Django server on port $Port..." -ForegroundColor Cyan
python manage.py runserver "127.0.0.1:$Port"