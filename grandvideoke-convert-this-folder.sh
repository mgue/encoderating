#encoder for Grand-Videoke-Tkr-341mp - Files should be put in VIDEO folder on SD Card
#assming u have ffmpeg command line and a unix terminal - this should do the trick on the current folder (or whereever you ls)
IFS=$'\n';for x in `ls *.mp4|sed "s/.mp4//g"`;do ffmpeg -ss 5 -i $x.mp4 -s 720x480 -vcodec mpeg4 -acodec mp3 -y $x.avi;done
