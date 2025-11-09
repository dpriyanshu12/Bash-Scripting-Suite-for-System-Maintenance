@echo off
:: maintenance_suite.bat - Run all maintenance tasks

:: Ensure script runs from its own folder
cd /d "%~dp0"

set "LOGFILE=%USERPROFILE%\system_maintenance.log"

echo ================================================== >> "%LOGFILE%"
echo [%date% %time%] Starting System Maintenance Suite >> "%LOGFILE%"
echo ==================================================

call "backup.bat"
call "clean_update.bat"
call "log_monitor.bat"

echo [%date% %time%] All tasks completed successfully. >> "%LOGFILE%"
echo Maintenance suite finished successfully!
pause
