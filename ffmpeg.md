<!-- -*- coding: utf-8; -*- -->

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

<https://blog.mediacru.sh/2013/12/23/The-right-way-to-encode-HTML5-video.html>.

    ffmpeg -i input.foo \
           -c:v libvpx \
           -c:a libvorbis
           -pix_fmt yuv420p \
           -quality good \
           -b:v 2M \
           -crf 5 \
           -vf "scale=trunc(in_w/2)*2:trunc(in_h/2)*2" \
           output.webm

### Map

<http://trac.ffmpeg.org/wiki/How%20to%20use%20-map%20option>

    ffmpeg -i input.foo \
           -map 0:0
           -map 0:1 \
           -codec:v:0 libtheora \
           -codec:a:0 libvorbis \
           output.webm
