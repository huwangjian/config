@echo off

set CONNECTION="Broadband Connection"
set USERNAME=username
set PASSWORD=password

for /f "tokens=1-3 delims=/" %%a in ("%DATE:~0,10%") do ( 
for /f "tokens=1,2 delims=:" %%i in ('time /t') do ( 
set "yy=%%a" & set "mm=%%b" & set "dd=%%c"
set "HH=%%i" & set "min=%%j"
))

set TIME=%yy%%mm%%dd%%HH%%min%

:DIAL
for /f "tokens=14" %%i in ('ipconfig ^| find /i "IPv4 Address"') do echo IP:  %%i
echo.

echo Disconnecting %CONNECTION%
rasdial /disconnect
echo.

ping 127.0.0.1 -n 10 >nul

rasdial %CONNECTION% %USERNAME% %PASSWORD%
echo.

for /f "tokens=14" %%j in ('ipconfig ^| find /i "IPv4 Address"') do set IP=%%j
for /f "tokens=1-3 delims=." %%a in ("%IP%") do set IPF=%%a.%%b.%%c 

findstr "%yy%/%mm%/%dd%.*%IPF%" used.txt && goto REDIAL
goto NEWIP

:REDIAL
echo %yy%/%mm%/%dd% %HH%:%min%      %IP% >> used.txt
echo.

echo Redialing...
ping 127.0.0.1 -n 10 >nul
goto DIAL

:NEWIP

ipconfig /flushdns
netsh interface ipv4 delete neighbors

echo.
for /f "tokens=14" %%j in ('ipconfig ^| find /i "IPv4 Address"') do set IP=%%j
echo NEWIP:  %IP%
echo %yy%/%mm%/%dd% %HH%:%min%      %IP% >> used.txt

del d:\temp\index.html
wget -O d:\temp\index.html www.ifeng.com
ping pop.bjgwbn.net.cn -n 1 >nul