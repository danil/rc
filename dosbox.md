<!-- -*- coding: utf-8; -*- -->

DOSBox
======

Full screen `Alt + Enter`

Failed to open alsa seq
-----------------------

Log:

    ALSA lib seq_hw.c:457:(snd_seq_hw_open) open /dev/snd/seq failed: Permission denied
    ALSA:Can't open sequencer

Reloading the snd_seq module:

    modprobe snd_seq
