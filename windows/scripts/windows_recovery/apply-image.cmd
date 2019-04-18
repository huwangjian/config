@echo off

mkdir d:\temp

dism /Apply-Image /ImageFile:d:\windows\sources\install.wim /Index:1 /ApplyDir:c:\ /Verify /ScratchDir:d:\temp