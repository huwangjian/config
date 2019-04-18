@echo off
mkdir f:\temp
dism /Image:C:\  /Cleanup-Image /StartComponentCleanup /ResetBase /ScratchDir:f:\temp

rem dism /online /Cleanup-Image /StartComponentCleanup /ResetBase
