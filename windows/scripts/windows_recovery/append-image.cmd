mkdir e:\temp

dism /Append-image /ImageFile:e:\windows\sources\install.wim /ScratchDir:e:\temp /CaptureDir:c:\ /name:"Windows 8.1 Enterprise with Office"
