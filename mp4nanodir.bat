@echo off
echo Encoding Directory %~d1%~p1
%~d1:
cd "%~d1%~p1"
for /f "delims=|" %%a IN ('dir /b %~d1%~p1\*.mp4') do call mp4nano.bat "%%a"
