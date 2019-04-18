@echo off
pause
SET OUTDIR="D:\"
SET SRCDIR="%~dp0"
SET DESKTOP="%USERPROFILE%\×ÀÃæ\"

copy /y portableapps.7z %OUTDIR%portableapps.exe
%OUTDIR%portableapps.exe -y -o%OUTDIR%
%OUTDIR%StartPortableApps.exe

echo %OUTDIR%StartPortableApps.exe > %DESKTOP%start.cmd
echo shutdown -r -t 3 > %DESKTOP%logoff.cmd"

echo @echo off > %DESKTOP%update.cmd
echo cd /d %OUTDIR% >> %DESKTOP%update.cmd
echo set PATH=%path%;%OUTDIR%PortableApps\7-ZipPortable\App\7-Zip\; >> %DESKTOP%update.cmd
echo 7z.exe a portableapps.7z Documents\ PortableApps\ StartPortableApps.exe -mx1 >> %DESKTOP%update.cmd
echo copy /y /b %OUTDIR%PortableApps\7-ZipPortable\App\7-Zip\7zCon.sfx + portableapps.7z %SRCDIR%portableapps.7z  >> %DESKTOP%update.cmd
echo pause >> %DESKTOP%update.cmd

pause