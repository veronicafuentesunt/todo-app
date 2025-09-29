# Step 1: Create venv if it doesn't exist
if (-Not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment..."
    python -m venv .venv
}

# Step 2: Activate the venv
Write-Host "Activating virtual environment..."
.venv\Scripts\Activate.ps1

# Step 3: Upgrade pip (optional but recommended)
python -m pip install --upgrade pip

# Step 4: Install dependencies if requirements.txt exists
if (Test-Path "requirements.txt") {
    Write-Host "Installing dependencies..."
    pip install -r requirements.txt
}

# Step 5: Run Django server
Write-Host "Starting Django server..."
python manage.py runserver