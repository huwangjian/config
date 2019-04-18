@echo off

for /f "tokens=14" %%i in ('ipconfig ^| find /i "IPv4 Address"') do set ip=%%i
for /f "tokens=13" %%i in ('ipconfig ^| find /i "Default Gateway . . . . . . . . . : 192.168."') do set gw=%%i

echo Default Gateway . . . . . . . . . : %gw%
echo IPv4 Address. . . . . . . . . . . : %ip%

echo.
choice /C 012L /T 10 /D L
SET /a I=%ERRORLEVEL%-1

IF %I%==3 (
nmap -sP -PE -PA80,135 %gw%/24
) ELSE (
nmap -sP -PE -PA80,135 192.168.%I%.1/24
)

echo.
choice /C YN /T 10 /D N /M "More......"

IF %ERRORLEVEL%==1 (
nmap -T4 -A -v 192.168.%I%.1/24 --exclude 192.168.%I%.1,192.168.%I%.222
pause
) ELSE exit