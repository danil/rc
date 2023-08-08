# MPlayer rcc

    mplayer -vf cropdetect
    mplayer -vo xv -spuaa 3 -zoom m -xy 1.6 -vf crop=624:272:8:102 \
            -stop-xscreensave -alang ru \
            -sub Pioneer.One.srt big_buck_bunny_720_stereo.ogg
    mplayer dvd://1 -dvd-device "mnt/tmp/dir"

## Fullscreen

    mvp --fs

## Webcam

    mplayer tv:// -tv driver=v4l2:width=160:height=120:device=/dev/video0
    mpv av://v4l2:/dev/video0

## Audio CD

Play tracks 5, 6 and 7

    mpv -cdrom-device /dev/cdrom cdda://5-7 -cache 5000

## Smooth playback

`-cache 50000` specifies 50 MBytes memory (in kBytes) to use when
pre-caching a file or URL.

    mplayer -cache 50000 -mc 0.001 -autosync 30 big_buck_bunny_720_stereo.ogg

## Screenshot

```
s
```
