@echo off
:: clean_update.bat - Delete temporary files and clear recycle bin
set "LOGFILE=%USERPROFILE%\system_maintenance.log"

echo [%date% %time%] Starting cleanup... >> "%LOGFILE%"
echo Cleaning temporary files...
del /s /q "%TEMP%\." >nul 2>&1
echo [%date% %time%] Temp files deleted. >> "%LOGFILE%"

echo Clearing Recycle Bin...
PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo [%date% %time%] Recycle Bin cleared. >> "%LOGFILE%"

echo Cleanup completed successfully!
pause
