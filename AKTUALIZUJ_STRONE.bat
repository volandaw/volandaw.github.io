@echo off
cd /d "%~dp0"

set PYEXE=%USERPROFILE%\AppData\Local\miniconda3\envs\0d_zera_do_ai\python.exe

echo ===============================================
echo   Aktualizacja i publikacja strony portfolio
echo ===============================================
echo.

if not exist "%PYEXE%" (
    echo BLAD: nie znaleziono Pythona pod sciezka:
    echo %PYEXE%
    pause
    exit /b 1
)

echo Uzywam Pythona: %PYEXE%
echo.
echo --- Publikuje strone na gh-pages (widoczna na volandaw.github.io) ---
"%PYEXE%" -m mkdocs gh-deploy --force
if errorlevel 1 (
    echo BLAD: publikacja mkdocs gh-deploy nie powiodla sie.
    pause
    exit /b 1
)

echo.
echo --- Wysylam kopie plikow zrodlowych na GitHub (main) ---
git add -A
git commit -m "Aktualizacja strony %date% %time%"
git push origin main

echo.
echo ===============================================
echo   Gotowe! Otwieram strone w przegladarce...
echo ===============================================
start "" "https://volandaw.github.io/?v=%RANDOM%"
timeout /t 3 >nul
