@echo off
echo 0
%~d1:
cd "%~d1%~p1"
mkdir originals
ffmpeg -i %1 -ar 48000 -ac 2 -y "%~d1%~p1%~n1-a.wav"
wavegain -t -g +12.0 -y "%~d1%~p1%~n1-a.wav"
ffmpeg -i %1 -vcodec copy -an -y "%~d1%~p1%~n1-v%~x1"
ffmpeg -i "%~d1%~p1%~n1-a.wav" -i "%~d1%~p1%~n1-v%~x1" -acodec aac -strict -2 -profile:v baseline -level 3.0 -q:v 0 -q:a 0  -vf scale=640:-1 -y "%~d1%~p1%~n1 (640w).mp4"
del "%~n1-a.wav"
del "%~n1-v%~x1"
move %1 originals\
