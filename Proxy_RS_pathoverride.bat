@echo off
:: -------------------------------
:: Redshift Path Override Setup
:: version 1.1
:: Author : JamesDo ( fb.com/jamesdo.vfx/ )
:: -------------------------------

set CURRENT_DIR=%~dp0
set OVERRIDE_FILE=%CURRENT_DIR%redshift_path_override.txt

echo My name JamesDo, I'm here to help you change Proxy Redshift Path
echo Ban muon lam gi?
echo [1] Cap nhat file override .txt co san
echo [2] Tao file override moi
echo [3] Reset (xoa hoan toan REDSHIFT_PATHOVERRIDE_FILE khoi Windows)
echo [4] Author
set /p MODE=

if "%MODE%"=="1" goto UPDATE_ONLY
if "%MODE%"=="2" goto NEW_FILE
if "%MODE%"=="3" goto RESET_ENV
if "%MODE%"=="4" goto OPEN_FB

echo Lua chon khong hop le.
pause
exit /b

:UPDATE_ONLY
if exist "%OVERRIDE_FILE%" (
    set REDSHIFT_PATHOVERRIDE_FILE=%OVERRIDE_FILE%
    setx REDSHIFT_PATHOVERRIDE_FILE "%OVERRIDE_FILE%"
    echo Da cap nhat REDSHIFT_PATHOVERRIDE_FILE tro toi: %OVERRIDE_FILE%
) else (
    echo Khong tim thay file override hien tai: %OVERRIDE_FILE%
)
pause
exit /b

:NEW_FILE
if exist "%OVERRIDE_FILE%" del "%OVERRIDE_FILE%"

:LOOP
echo.
echo Nhap Old Proxy Path (go "Done" de ket thuc):
set /p OLD_PATH=

if /I "%OLD_PATH%"=="Done" goto END
if "%OLD_PATH%"=="" (
    echo  Duong dan cu khong duoc bo trong.
    goto LOOP
)

echo Nhap New Proxy Path:
set /p NEW_PATH=
if "%NEW_PATH%"=="" (
    echo  Duong dan moi khong duoc bo trong.
    goto LOOP
)

>>"%OVERRIDE_FILE%" echo "%OLD_PATH%" "%NEW_PATH%"
goto LOOP

:END
set REDSHIFT_PATHOVERRIDE_FILE=%OVERRIDE_FILE%
setx REDSHIFT_PATHOVERRIDE_FILE "%OVERRIDE_FILE%"

echo File override duoc tao tai: %OVERRIDE_FILE%
echo Da thay duong dan OLD PATH thanh NEW PATH va luu vao file .txt ( khong duoc xoa .txt vua tao vi he thong dang doc truc tiep )
echo Tat phan mem va mo lai de duoc cap nhat
pause
exit /b

:RESET_ENV
set REDSHIFT_PATHOVERRIDE_FILE=
reg delete "HKCU\Environment" /F /V REDSHIFT_PATHOVERRIDE_FILE
echo Da xoa hoan toan REDSHIFT_PATHOVERRIDE_FILE khoi Windows.
echo Neu chua bien mat khoi list, hay dang xuat hoac mo lai CMD de cap nhat.
pause
exit /b

:OPEN_FB
start https://fb.com/jamesdo.vfx/
exit /b
