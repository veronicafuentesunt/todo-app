# Type this to activate the environment: .\.venv\Scripts\Activate.ps1
# This is to run the server (in Powershell):
    # First
    # Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    # Second
    # .\scripts\start.ps1

# When installing new packages, run: pip freeze > requirements.txt

param([string]$Port = "8000")

# 1) Create & activate venv
if (-not (Test-Path ".\.venv\Scripts\Activate.ps1")) {
    python -m venv .venv
}
& .\.venv\Scripts\Activate.ps1

# 2) Install (or skip) deps
pip install -r requirements.txt

# 3) Apply migrations (point at backend/manage.py)
Write-Host "Applying migrations…" -ForegroundColor Cyan
python .\backend\manage.py migrate

# 4) Start the server (point at backend/manage.py)
Write-Host "Starting Django server on port $Port…" -ForegroundColor Cyan
python .\backend\manage.py runserver "127.0.0.1:$Port"