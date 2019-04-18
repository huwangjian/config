@echo off

reagentc /info
echo =================================================

dism /get-wiminfo /wimfile:d:\windows\sources\install.wim
echo =================================================

echo.
set /p index=Enter Your Choice:
echo %index%
echo =================================================

echo.
reagentc /setosimage /path d:\windows\sources /index %index%
echo =================================================

echo.
reagentc /info
pause