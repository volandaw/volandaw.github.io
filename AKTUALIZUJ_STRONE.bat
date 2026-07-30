@echo off
cd /d "%~dp0"

echo ===============================================
echo   Aktualizacja i publikacja strony portfolio
echo ===============================================
echo.

call conda activate 0d_zera_do_ai
if errorlevel 1 (
    echo BLAD: nie udalo sie aktywowac srodowiska conda "0d_zera_do_ai".
    pause
    exit /b 1
)

echo.
echo --- Publikuje strone na gh-pages (widoczna na volandaw.github.io) ---
python -m mkdocs gh-deploy --force
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
echo   Gotowe! Strona: https://volandaw.github.io/
echo ===============================================
pause
