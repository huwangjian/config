@echo off

for /f "tokens=1-3 delims=/" %%a in ("%DATE:~0,10%") do ( 
for /f "tokens=1,2 delims=:" %%i in ('time /t') do ( 
set "yy=%%a" & set "mm=%%b" & set "dd=%%c"
set "HH=%%i" & set "min=%%j"
))

set TIME=%yy%%mm%%dd%.%HH%%min%

mkdir f:\temp

dism /Capture-Image /ImageFile:f:\windows\sources\install.wim /ScratchDir:f:\temp /CaptureDir:c:\ /name:"Windows 10 Enterprise"