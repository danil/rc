# Webcam

## FFmpeg

    ffplay -fs -f video4linux2 /dev/video0

## mplayer

<http://en.gentoo-wiki.com/wiki/Webcam#Mplayer>

    mplayer tv:// -tv driver=v4l2:width=160:height=120:device=/dev/video0
