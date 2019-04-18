open ~/Library/Caches/

rm -rf ~/Library/Caches/Google/Chrome/Default
ln -s /Volumes/RamDisk/Temp/Chrome/ ~/Library/Caches/Google/Chrome/Default

rm -rf ~/Library/Caches/com.apple.Safari
ln -s /Volumes/RamDisk/Temp/Safari/ ~/Library/Caches/com.apple.Safari

rm -rf ~/Library/Caches/Adobe/Flash\ Player/AssetCache
ln -s /Volumes/RamDisk/Temp/Adobe/AssetCache/ ~/Library/Caches/Adobe/Flash\ Player/AssetCache

rm -rf ~/Library/Caches/com.netease.163music
ln -s /Volumes/RamDisk/Temp/Others/com.netease.163music ~/Library/Caches/com.netease.163music

rm -rf ~/Library/Containers/com.netease.163music/Data/Caches
ln -s /Volumes/RamDisk/Temp/Others/com.netease.163music ~/Library/Containers/com.netease.163music/Data/Caches

#Firefox:
#browser.cache.disk.parent_directory
#/Volumes/RamDisk/Firefox