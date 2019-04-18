rd/s/q "%userprofile%\AppData\Local\Temp"
mklink /d "%userprofile%\AppData\Local\Temp" R:\Temp\
rd/s/q "c:\Windows\Temp"
mklink /d "c:\Windows\Temp" R:\Temp\

rd/s/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache"
rd/s/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\GPUCache"
mklink /d "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache" R:\Temp\Chrome\Cache
mklink /d "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\GPUCache" R:\Temp\Chrome\GPUCache
mklink /d "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Pepper Data\Shockwave Flash\WritableRoot\#SharedObjects" R:\Temp\Flash\SharedObjects
mklink /d "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Pepper Data\Shockwave Flash\CacheWritableAdobeRoot\AssetCache" R:\Temp\Flash\AssetCache

rd/s/q "%userprofile%\AppData\Roaming\Macromedia\Flash Player\#SharedObjects"
rd/s/q "%userprofile%\AppData\Roaming\Adobe\Flash Player\AssetCache"
rd/s/q "%userprofile%\AppData\Roaming\Adobe\Flash Player\NativeCache"
rd/s/q "%userprofile%\AppData\Roaming\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys"
mklink /d "%userprofile%\AppData\Roaming\Macromedia\Flash Player\#SharedObjects" R:\Temp\Flash\SharedObjects
mklink /d "%userprofile%\AppData\Roaming\Adobe\Flash Player\AssetCache" R:\Temp\Flash\AssetCache
mklink /d "%userprofile%\AppData\Roaming\Adobe\Flash Player\NativeCache" R:\Temp\Flash\NativeCache
mklink /d "%userprofile%\AppData\Roaming\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys" R:\Temp\Flash\


rd/s/q "%userprofile%\AppData\Local\Netease\CloudMusic\Cache"
rd/s/q "%userprofile%\AppData\Roaming\Tencent\Logs"
mklink /d "%userprofile%\AppData\Local\Netease\CloudMusic\Cache" R:\Temp\Music\Cache
mklink /d "%userprofile%\AppData\Roaming\Tencent\Logs" R:\Temp\Logs

rd/s/q "%userprofile%\AppData\Local\Iridium\User Data\Default\Cache"
mklink /d "%userprofile%\AppData\Local\Iridium\User Data\Default\Cache" R:\Temp\Cache

pause