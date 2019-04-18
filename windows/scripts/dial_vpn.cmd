@echo off

set CONNECTION="VPN"
set USERNAME=vpn
set PASSWORD=vpntest


ipconfig | find "VPN"

if /i "%errorlevel%"=="0" rasdial /disconnect && goto exit

rasdial %CONNECTION% %USERNAME% %PASSWORD%

:exit
exit