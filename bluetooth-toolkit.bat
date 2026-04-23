@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ==================================================
:: TOOL INFO
:: ==================================================
set "TOOL_NAME=Bluetooth Audio Toolkit"
set "VERSION=v1.0.0"
set "AUTHOR=@power0matin"

title %TOOL_NAME% %VERSION% - %AUTHOR%

:: ==================================================
:: ENABLE ANSI (SAFE + FALLBACK)
:: ==================================================
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

set "ANSI=1"
if "%ESC%"=="" set "ANSI=0"

set "GREEN=%ESC%[32m"
set "RED=%ESC%[31m"
set "YELLOW=%ESC%[33m"
set "CYAN=%ESC%[36m"
set "RESET=%ESC%[0m"

:: ==================================================
:: LOG FILE
:: ==================================================
set "LOGFILE=%~dp0bt_toolkit.log"

goto init

:: ==================================================
:: INIT
:: ==================================================
:init
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo ============================================
    echo   %TOOL_NAME% %VERSION%
    echo ============================================
    echo.
    echo [ERROR] Administrator privileges required
    echo.
    pause
    goto exit_safe
)

goto menu

:: ==================================================
:: LOG SYSTEM
:: ==================================================
:log
echo [%date% %time%] %*>>"%LOGFILE%"
goto :eof

:: ==================================================
:: LOADING ANIMATION (STABLE)
:: ==================================================
:loading
for /l %%i in (1,1,3) do (
    <nul set /p="Processing"
    timeout /t 1 >nul
    echo .
)
goto :eof

:: ==================================================
:: SAFE REG ADD
:: ==================================================
:safe_add
reg add %* >nul 2>&1

if %errorlevel% neq 0 (
    call :log ERROR ADD %*
    if "%ANSI%"=="1" (
        echo %RED%[FAILED]%RESET% %*
    ) else (
        echo [FAILED] %*
    )
) else (
    call :log SUCCESS ADD %*
    if "%ANSI%"=="1" (
        echo %GREEN%[SUCCESS]%RESET% %*
    ) else (
        echo [SUCCESS] %*
    )
)

goto :eof

:: ==================================================
:: SAFE REG DELETE
:: ==================================================
:safe_del
reg delete %* >nul 2>&1

if %errorlevel% neq 0 (
    call :log WARN DEL %*
    if "%ANSI%"=="1" (
        echo %YELLOW%[WARN]%RESET% %*
    ) else (
        echo [WARN] %*
    )
) else (
    call :log SUCCESS DEL %*
    if "%ANSI%"=="1" (
        echo %GREEN%[SUCCESS]%RESET% %*
    ) else (
        echo [SUCCESS] %*
    )
)

goto :eof

:: ==================================================
:: MENU
:: ==================================================
:menu
cls
echo ============================================
echo   %TOOL_NAME% %VERSION%
echo   Author: %AUTHOR%
echo ============================================
echo.
echo [1] Full Optimization (Best Quality)
echo [2] Enable AAC Only
echo [3] Force SBC Mode
echo [4] Reset to Default
echo [0] Exit
echo.
set /p choice=Select option: 

if "%choice%"=="1" goto opt
if "%choice%"=="2" goto aac
if "%choice%"=="3" goto sbc
if "%choice%"=="4" goto reset
if "%choice%"=="0" goto exit_safe

echo Invalid input
timeout /t 1 >nul
goto menu

:: ==================================================
:: FULL OPTIMIZATION
:: ==================================================
:opt
cls
echo Applying FULL optimization...
call :log START OPT

call :loading

call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthHfEnum\Parameters" /v DisableHfp /t REG_DWORD /d 1 /f
call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v EnableAAC /t REG_DWORD /d 1 /f
call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v MaxSupportedBitpool /t REG_DWORD /d 53 /f
call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v MinSupportedBitpool /t REG_DWORD /d 2 /f

echo.
echo ============================
echo Optimization Completed
echo ============================
call :log DONE OPT
pause
goto menu

:: ==================================================
:: AAC MODE
:: ==================================================
:aac
cls
echo Enabling AAC...
call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v EnableAAC /t REG_DWORD /d 1 /f
pause
goto menu

:: ==================================================
:: SBC MODE
:: ==================================================
:sbc
cls
echo Forcing SBC Mode...
call :safe_add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v EnableAAC /t REG_DWORD /d 0 /f
pause
goto menu

:: ==================================================
:: RESET
:: ==================================================
:reset
cls
echo Resetting system settings...
call :loading

call :safe_del "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /f
call :safe_del "HKLM\SYSTEM\CurrentControlSet\Services\BthHfEnum\Parameters" /v DisableHfp /f

echo.
echo Reset Completed
pause
goto menu

:: ==================================================
:: EXIT
:: ==================================================
:exit_safe
endlocal
exit /b 0