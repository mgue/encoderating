@echo off
%~d1:
cd "%~d1%~p1"
mkdir originals
echo extracting audio
ffmpeg -i %1 -ar 48000 -ac 2 -y "%~d1%~p1%~n1-a.wav"
echo normalizing audio
wavegain -t -g +12.0 -y "%~d1%~p1%~n1-a.wav"
echo extracting video
ffmpeg -i %1 -vcodec copy -an -y "%~d1%~p1%~n1-v%~x1"
echo putting them together
ffmpeg -i "%~d1%~p1%~n1-a.wav" -i "%~d1%~p1%~n1-v%~x1" -acodec aac -strict -2 -profile:v baseline -level 3.0 -q:v 0 -q:a 0  -vf scale=640:-1 -y "%~d1%~p1%~n1 (640w).mp4"
echo cleanup
del "%~n1-a.wav"
del "%~n1-v%~x1"
move %1 originals\
echo done
