@echo off
setlocal enabledelayedexpansion

:: Debug backup.bat - writes verbose log to system_maintenance_debug.log
set "BACKUP_SRC=%USERPROFILE%\OneDrive\Documents"
set "BACKUP_DEST=C:\BackupFiles"
set "LOGFILE=%USERPROFILE%\system_maintenance_debug.log"
echo -------------------------------------------------------->> "%LOGFILE%"
echo [%date% %time%] START DEBUG BACKUP >> "%LOGFILE%"
echo Using BACKUP_SRC=%BACKUP_SRC% >> "%LOGFILE%"
echo Using BACKUP_DEST=%BACKUP_DEST% >> "%LOGFILE%"

:: Ensure backup folder exists
if not exist "%BACKUP_DEST%" (
  mkdir "%BACKUP_DEST%"
  echo [%date% %time%] Created %BACKUP_DEST% >> "%LOGFILE%"
)

:: Build safe timestamp
for /f "tokens=1-3 delims=/" %%a in ("%date%") do set "d1=%%a" & set "d2=%%b" & set "d3=%%c"
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set "t1=%%a" & set "t2=%%b"
set "DATESTAMP=%d1%-%d2%-%d3%"
set "TIMESTAMP=%t1%-%t2%"
set "BACKUP_FILE=%BACKUP_DEST%\backup_%DATESTAMP%_%TIMESTAMP%.zip"

echo [%date% %time%] Will create: %BACKUP_FILE% >> "%LOGFILE%"
echo Creating backup from "%BACKUP_SRC%" to "%BACKUP_FILE%"...
echo [%date% %time%] START Compress-Archive >> "%LOGFILE%"

powershell -NoProfile -Command ^
"try { Compress-Archive -Path '%BACKUP_SRC%' -DestinationPath '%BACKUP_FILE%' -Force -ErrorAction Stop; Write-Host 'PS_OK' } catch { Write-Host 'PS_ERR:' $_.Exception.Message; exit 1 }" 1> "%TEMP%\ps_stdout.txt" 2> "%TEMP%\ps_stderr.txt"

type "%TEMP%\ps_stdout.txt"
type "%TEMP%\ps_stderr.txt" >&2

if exist "%BACKUP_FILE%" (
  for %%I in ("%BACKUP_FILE%") do set "FILESIZE=%%~zI"
) else (
  set "FILESIZE=0"
)

echo [%date% %time%] After Compress-Archive, file exists? %BACKUP_FILE% >> "%LOGFILE%"
echo [%date% %time%] Size = %FILESIZE% bytes >> "%LOGFILE%"

if "%FILESIZE%"=="0" (
  echo [%date% %time%] ERROR: Backup file missing or 0 bytes >> "%LOGFILE%"
  echo Backup failed or produced 0 bytes. See %LOGFILE% for details.
) else (
  echo [%date% %time%] Backup succeeded: %BACKUP_FILE% >> "%LOGFILE%"
  echo Backup done successfully: %BACKUP_FILE%
)

pause
