@echo off
:: log_monitor.bat - Save recent system log entries to a file
set "OUTPUT=%USERPROFILE%\log_monitor_output.txt"
set "LOGFILE=%USERPROFILE%\system_maintenance.log"

echo [%date% %time%] Checking Windows Event Logs... >> "%LOGFILE%"
powershell -NoProfile -Command "Get-EventLog -LogName System -Newest 10 | Format-Table -AutoSize" > "%OUTPUT%"
echo [%date% %time%] Log results saved to %OUTPUT% >> "%LOGFILE%"
echo Logs extracted successfully!
pause
