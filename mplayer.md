<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

MPlayer
=======

    mplayer -vf cropdetect
    mplayer -vo xv -spuaa 3 -zoom m -xy 1.6 -vf crop=624:272:8:102 \
            -stop-xscreensave -alang ru \
            -sub Pioneer.One.srt big_buck_bunny_720_stereo.ogg
    mplayer dvd://1 -dvd-device "mnt/tmp/dir"

Webcam
------

<http://en.gentoo-wiki.com/wiki/Webcam#Mplayer>

    mplayer tv:// -tv driver=v4l2:width=160:height=120:device=/dev/video0

Audio CD
--------

Play tracks 5, 6 and 7

    mpv -cdrom-device /dev/cdrom cdda://5-7 -cache 5000

Smooth playback
---------------

`-cache 50000` specifies 50 MBytes memory (in kBytes) to use when
precaching a file or URL.

    mplayer -cache 50000 -mc 0.001 -autosync 30 big_buck_bunny_720_stereo.ogg

[Smooth playback]: http://freshmeat.net/articles/fine-tuning-mplayer
