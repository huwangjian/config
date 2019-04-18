@echo off
SET HOSTS=C:\WINDOWS\system32\drivers\etc\hosts

takeown /f "%HOSTS%"
icacls "%HOSTS%" /grant administrators:F

echo.
rem attrib -r %HOSTS%
copy /y %HOSTS% hosts.bak
copy /y hosts %HOSTS%
rem attrib +r %HOSTS%

ipconfig /flushdns
echo.

notepad %HOSTS%