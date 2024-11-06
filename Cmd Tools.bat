@echo off
AK Code Multi-purpose CMD Tool
:menu
cls
echo.
echo ===============================
echo       Enhanced Multi-purpose CMD Tool
echo ===============================
echo.
echo [1] System Information
echo [2] Disk Check and Repair
echo [3] Disk Cleanup
echo [4] Internet Connection Test (Ping)
echo [5] List Installed Programs
echo [6] Shutdown After Delay
echo [7] Restart Computer
echo [8] Network Status
echo [9] User Management
echo [10] Battery Status Report
echo [11] Clear DNS Cache
echo [12] IP Address Information
echo [13] Running Processes
echo [14] End Specific Process
echo [15] CPU and Memory Usage
echo [16] Command History
echo [17] Open Home Directory
echo [18] System Uptime
echo [19] Open Applications Quickly
echo [20] Create New File
echo [21] Network Troubleshooter
echo [22] System Updates
echo [23] Hard Disk Performance Check
echo [24] System Health Report
echo [25] Windows Version
echo [26] Services List
echo [0] Exit
echo.
set /p choice=Enter option number:

if "%choice%"=="1" goto systeminfo
if "%choice%"=="2" goto chkdsk
if "%choice%"=="3" goto cleanmgr
if "%choice%"=="4" goto ping
if "%choice%"=="5" goto programs
if "%choice%"=="6" goto shutdown
if "%choice%"=="7" goto restart
if "%choice%"=="8" goto netstat
if "%choice%"=="9" goto users
if "%choice%"=="10" goto battery
if "%choice%"=="11" goto flushdns
if "%choice%"=="12" goto ipconfig
if "%choice%"=="13" goto tasklist
if "%choice%"=="14" goto killtask
if "%choice%"=="15" goto memory
if "%choice%"=="16" goto history
if "%choice%"=="17" goto home
if "%choice%"=="18" goto uptime
if "%choice%"=="19" goto openapps
if "%choice%"=="20" goto newfile
if "%choice%"=="21" goto networktroubleshooter
if "%choice%"=="22" goto updates
if "%choice%"=="23" goto hddperf
if "%choice%"=="24" goto healthreport
if "%choice%"=="25" goto windowsver
if "%choice%"=="26" goto services
if "%choice%"=="0" exit
goto invalid

:systeminfo
cls
echo System Information:
systeminfo
pause
goto menu

:chkdsk
cls
echo Disk Check and Repair:
chkdsk /f
pause
goto menu

:cleanmgr
cls
echo Disk Cleanup:
cleanmgr
pause
goto menu

:ping
cls
set /p site=Enter the website to test connection (e.g., google.com): 
ping %site%
pause
goto menu

:programs
cls
echo Installed Programs:
wmic product get name
pause
goto menu

:shutdown
cls
set /p time=Enter delay in seconds for shutdown:
shutdown /s /t %time%
pause
goto menu

:restart
cls
shutdown /r
pause
goto menu

:netstat
cls
echo Network Status:
netstat -an
pause
goto menu

:users
cls
echo User Management:
echo [1] Add User
echo [2] Delete User
set /p action=Choose an option: 
if "%action%"=="1" (
    set /p username=Enter new username: 
    set /p password=Enter password: 
    net user %username% %password% /add
) else if "%action%"=="2" (
    set /p username=Enter username to delete: 
    net user %username% /delete
)
pause
goto menu

:battery
cls
echo Battery Status Report:
powercfg /batteryreport
pause
goto menu

:flushdns
cls
echo Clearing DNS Cache:
ipconfig /flushdns
pause
goto menu

:ipconfig
cls
echo IP Address Information:
ipconfig
pause
goto menu

:tasklist
cls
echo Running Processes:
tasklist
pause
goto menu

:killtask
cls
set /p process=Enter process name to end (e.g., notepad.exe): 
taskkill /im %process% /f
pause
goto menu

:memory
cls
echo CPU and Memory Usage:
wmic cpu get loadpercentage
wmic OS get FreePhysicalMemory
pause
goto menu

:history
cls
echo Command History:
doskey /history
pause
goto menu

:home
cls
echo Opening Home Directory...
explorer .
pause
goto menu

:uptime
cls
echo System Uptime:
systeminfo | find "System Boot Time"
pause
goto menu

:openapps
cls
echo Open Applications Quickly:
echo [1] Notepad
echo [2] Calculator
echo [3] Task Manager
set /p app=Choose an application: 
if "%app%"=="1" notepad
if "%app%"=="2" calc
if "%app%"=="3" taskmgr
pause
goto menu

:newfile
cls
set /p filename=Enter filename (with extension, e.g., file.txt): 
echo. > %filename%
echo File created successfully: %filename%
pause
goto menu

:networktroubleshooter
cls
echo Network Troubleshooter:
msdt.exe /id NetworkDiagnosticsNetworkAdapter
pause
goto menu

:updates
cls
echo System Updates:
start ms-settings:windowsupdate
pause
goto menu

:hddperf
cls
echo Hard Disk Performance Check:
winsat disk
pause
goto menu

:healthreport
cls
echo System Health Report:
perfmon /report
pause
goto menu

:windowsver
cls
echo Windows Version:
winver
pause
goto menu

:services
cls
echo List of Services:
net start
pause
goto menu

:invalid
cls
echo Invalid option, please choose a valid option.
pause
goto menu
