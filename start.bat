@echo off
chcp 65001 > nul
color 0A
cls

:: Stylish header
echo.
echo ==========================================
echo           Created by Kusaqawa
echo ==========================================
echo.

:: Python check
echo [*] Checking Python installation...
python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [!] Python not found. Please install Python manually!
    echo [+] Download from: https://www.python.org/downloads/
    pause
    exit /b 1
) else (
    echo [+] Python is installed.
)

:: Pip check
echo [*] Checking pip installation...
python -m pip --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [!] pip not found. Attempting to install...
    python -m ensurepip --upgrade
) else (
    echo [+] pip is installed.
)

:: Pip upgrade
echo [*] Upgrading pip...
python -m pip install --upgrade pip > nul
echo [+] pip upgraded.

:: Input file selection
echo.
echo =======================
echo Select input file:
echo =======================
set /p "input_file=Enter file path: "
if not exist "%input_file%" (
    echo [!] File does not exist!
    pause
    exit /b 1
)

:: Output file selection
echo.
echo =======================
echo Select output file:
echo =======================
set /p "output_file=Enter output path: "
if "%output_file%"=="" (
    echo [!] No output path specified!
    pause
    exit /b 1
)

:: Run obfuscator
echo.
echo [*] Running obfuscator...
python obfuscator.py --input "%input_file%" --output "%output_file%"

:: Completion
echo.
echo ==========================================
echo          Operation completed!
echo ==========================================
pause