<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009,
     2010 Danil Kutkevich <http://danil.kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

MPlayer
=======

               ************************************************
               **** Your system is too SLOW to play this!  ****
               ************************************************

    Possible reasons, problems, workarounds:
    - Most common: broken/buggy _audio_ driver
      - Try -ao sdl or use the OSS emulation of ALSA.
      - Experiment with different values for -autosync, 30 is a good start.
    - Slow video output
      - Try a different -vo driver (-vo help for a list) or try -framedrop!
    - Slow CPU
      - Don't try to play a big DVD/DivX on a slow CPU! Try some of the lavdopts,
        e.g. -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all.
    - Broken file
      - Try various combinations of -nobps -ni -forceidx -mc 0.
    - Slow media (NFS/SMB mounts, DVD, VCD etc)
      - Try -cache 8192.
    - Are you using -cache to play a non-interleaved AVI file?
      - Try -nocache.
    Read DOCS/HTML/en/video.html for tuning/speedup tips.
    If none of this helps you, read DOCS/HTML/en/bugreports.html.
