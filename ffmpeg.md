<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

FFmpeg
======

Codecs
------

### List

    ffmpeg -codecs

Re-encode
---------

Re-encode video to VP8 compression format <http://en.wikipedia.org/wiki/VP8>,
and audio to vorbis compression format <http://en.wikipedia.org/wiki/Vorbis>.

    ffmpeg -i input.mp4 \
           -map 0:0
           -map 0:1 \
           -codec:v:0 libtheora \
           -codec:a:0 libvorbis \
           output.webm
