@echo off

set ZIP="%PROGRAMFILES%\7-Zip\7z.exe"

for /f "tokens=1-3 delims=/" %%a in ("%DATE:~0,10%") do ( 
for /f "tokens=1,2 delims=:" %%i in ('time /t') do ( 
set "yy=%%a" & set "mm=%%b" & set "dd=%%c"
set "HH=%%i" & set "min=%%j"
))

set TIME=%yy%%mm%%dd%.%HH%%min%
set DEST=D:\Windows\Weiyun\backup\%TIME%.7z
set LIST=C:\Users\huwangjian\Software\backup\backup.lst

cd \
%ZIP% a %DEST% -mx0 -mmt=4 -mhe -ppass @%LIST%

PAUSE
%DEST%

REM for /f %1 in ('dir /b') do %ZIP% a %1.zip %1 -mx0 -mmt=4