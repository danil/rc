<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

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
