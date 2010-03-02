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
