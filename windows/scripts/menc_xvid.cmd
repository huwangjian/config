@echo off

SET BITRATE=572
SET SAMPLE=-ss 60 -endpos 20
SET OVC=-ovc xvid -xvidencopts bitrate=%BITRATE%:vhq=2:bvhq=1:chroma_opt:quant_type=mpeg
SET VF=-vf scale=320:-2,expand=320:240,harddup -noskip
SET SUB=-subcp enca:zh:GBK -subpos 95 -subfont-autoscale 2 -font "Microsoft YaHei" -sub %~n1.srt 

IF /i "%2" == "" goto ENCODER 
IF /i "%2" == "SAMPLE" goto SAMPLE
IF /i "%1" == "SAMPLE" SHIFT & goto SAMPLE


:ENCODER
TITLE Encoding - %1
ECHO.
TITLE PASS1 - %1
mencoder -o NUL -nosound %OVC%:turbo:pass=1 %VF% -sid 10 %1
TITLE PASS2 - %1
mencoder -o pass2.avi -oac pcm -channels 1 -srate 4000 %OVC%:pass=2 %VF% %SUB% %1
mplayer -ao pcm:file=audio.wav -vc dummy -vo null %1
lame -m j -V 4 -q 0 --vbr-new -b 32 audio.wav audio.mp3
mencoder -o %~n1.xvid.avi -oac copy -ovc copy -audiofile audio.mp3 pass2.avi
TITLE Done! - %1
goto :EOF

:SAMPLE
ECHO.
TITLE SAMPLE - %1
ECHO.
mencoder -o NUL -nosound %OVC%:turbo:pass=1 %VF% -sid 10 %SAMPLE% %1
mencoder -o pass2.avi -oac pcm -channels 1 -srate 4000 %OVC%:pass=2 %VF% %SUB% %SAMPLE% %1
mplayer -ao pcm:file=audio.wav -vc dummy -vo null %SAMPLE% %1
lame -m j -V 4 -q 3 --vbr-new -b 32 audio.wav audio.mp3
mencoder -o %~n1.sample.avi -oac copy -ovc copy -audiofile audio.mp3 pass2.avi
TITLE SAMPLE Done! - %1
goto :EOF