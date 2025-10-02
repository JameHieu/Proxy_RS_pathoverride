@echo off
:: -------------------------------
:: Redshift Path Override Setup
:: version 1.1
:: Author : JamesDo ( fb.com/jamesdo.vfx/ )
:: -------------------------------

set CURRENT_DIR=%~dp0
set OVERRIDE_FILE=%CURRENT_DIR%redshift_path_override.txt

echo My name JamesDo, I'm here to help you change Proxy Redshift Path
echo What do you want to do?
echo [1] Update existing override .txt file
echo [2] Create a new override file
echo [3] Reset (completely remove REDSHIFT_PATHOVERRIDE_FILE from Windows)
echo [4] Author
set /p MODE=

if "%MODE%"=="1" goto UPDATE_ONLY
if "%MODE%"=="2" goto NEW_FILE
if "%MODE%"=="3" goto RESET_ENV
if "%MODE%"=="4" goto OPEN_FB

echo Invalid choice.
pause
exit /b

:UPDATE_ONLY
if exist "%OVERRIDE_FILE%" (
    set REDSHIFT_PATHOVERRIDE_FILE=%OVERRIDE_FILE%
    setx REDSHIFT_PATHOVERRIDE_FILE "%OVERRIDE_FILE%"
    echo Updated REDSHIFT_PATHOVERRIDE_FILE pointing to: %OVERRIDE_FILE%
) else (
    echo Cannot find current override file: %OVERRIDE_FILE%
)
pause
exit /b

:NEW_FILE
if exist "%OVERRIDE_FILE%" del "%OVERRIDE_FILE%"

:LOOP
echo.
echo Enter Old Proxy Path (type "Done" to finish):
set /p OLD_PATH=

if /I "%OLD_PATH%"=="Done" goto END
if "%OLD_PATH%"=="" (
    echo  Old path cannot be empty.
    goto LOOP
)

echo Enter New Proxy Path:
set /p NEW_PATH=
if "%NEW_PATH%"=="" (
    echo  New path cannot be empty.
    goto LOOP
)

>>"%OVERRIDE_FILE%" echo "%OLD_PATH%" "%NEW_PATH%"
goto LOOP

:END
set REDSHIFT_PATHOVERRIDE_FILE=%OVERRIDE_FILE%
setx REDSHIFT_PATHOVERRIDE_FILE "%OVERRIDE_FILE%"

echo Override file created at: %OVERRIDE_FILE%
echo Replaced OLD PATH with NEW PATH and saved into the .txt file (do not delete this .txt file because the system is reading it directly)
echo Close and reopen the software to apply updates
pause
exit /b

:RESET_ENV
set REDSHIFT_PATHOVERRIDE_FILE=
reg delete "HKCU\Environment" /F /V REDSHIFT_PATHOVERRIDE_FILE
echo Completely removed REDSHIFT_PATHOVERRIDE_FILE from Windows.
echo If its still visible in the list, please log out or reopen CMD to refresh.
pause
exit /b

:OPEN_FB
start https://fb.com/jamesdo.vfx/
exit /b
