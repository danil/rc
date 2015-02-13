<!-- -*- coding: utf-8; -*- -->

Synaptics touchpad
==================

<http://en.wikipedia.org/wiki/Synaptics>,  
<http://en.gentoo-wiki.com/wiki/Synaptics_Touchpad>.

Real-Time Tweaking
------------------

* <http://en.gentoo-wiki.com/wiki/Synaptics_Touchpad#Real-Time_Tweaking>
* <https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Synclient>

    synclient EmulateTwoFingerMinZ=40

xorg.conf
---------

    Section "InputDevice"
      Identifier "Synaptics Touchpad"

<http://en.gentoo-wiki.com/wiki/Synaptics_Touchpad#Manual_Configuration>

      Driver "synaptics"
      Option "SendCoreEvents"
      Option "Protocol" "auto-dev"

### Real-Time Tweaking

<http://en.gentoo-wiki.com/wiki/Synaptics_Touchpad#.22Can.27t_access_shared_memory_area._SHMConfig_disabled.3F.22_error>,  
<http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Fine-tuning_with_synclient>.

Options: "on" or "off".

      Option "SHMConfig" "on"

### Touchpad device file

<http://en.gentoo-wiki.com/wiki/Synaptics_Touchpad#Touchpad_device_file>

      # Option "Device" "/dev/input/mouse0"

                  TopEdge
                     30
             +----------------+
             |       |        |
    LeftEdge |      560       | RightEdge
       30    |  -----+-360--  |   1130
             |       |        |
             |       |        |
             +----------------+
                    750
                 BottomEdge

      Option "LeftEdge"    "80"
      Option "RightEdge"   "1080"
      Option "TopEdge"     "80"
      Option "BottomEdge"  "680"
      Option "MinSpeed"    "0.4"
      Option "MaxSpeed"    "1"
      Option "AccelFactor" "0.15"


### [Tapping][]

* `1` — левая кнопка
* `2` — средняя кнопка (колесо)
* `3` — правая кнопка

* `TapButton1` — тап одним пальцем
* `TapButton2` — тап двумя пальцами
* `TapButton3` — тап тремя пальцами

Один палец — на левую кнопку.

      Option "TapButton1" "1"

Два пальца — на правую кнопку.

      Option "TapButton2" "3"

Не использовать тап тремя пальцами.

      Option "TapButton3" "0"

<http://wiki.archlinux.org/index.php/Тачпад_Synaptics#.D0.94.D0.B5.D1.82.D0.B0.D0.BB.D1.8C.D0.BD.D0.B0.D1.8F_.D0.BA.D0.BE.D0.BD.D1.84.D0.B8.D0.B3.D1.83.D1.80.D0.B0.D1.86.D0.B8.D1.8F>

Reduce delay between a button tap and the actual click.

<http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Delay_between_a_button_tap_and_the_actual_click>

      Option "FastTaps" "1"

Max time in ms for detecting tap.

      Option "MaxTapTime" "180"

      Option "MaxTapMove" "110"

[Tapping]: http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Tapping_issues

### [Edge scrolling][]

      Option "VertEdgeScroll"  "0"
      Option "HorizEdgeScroll" "0"

[Edge scrolling]: http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Edge_scrolling

### [Two-Finger scrolling][]

      Option "VertTwoFingerScroll"  "0"
      Option "HorizTwoFingerScroll" "1"

<https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Frequently_used_options>.

      Option "EmulateTwoFingerMinZ" "40"
      Option "EmulateTwoFingerMinW" "8"

[Two-Finger scrolling]: http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Two-Finger_scrolling

### Circular scrolling

<http://wiki.archlinux.org/index.php/Touchpad_Synaptics#Circular_scrolling>,  
<http://wiki.archlinux.org/index.php/Тачпад_Synaptics#.D0.9A.D1.80.D1.83.D0.B3.D0.BE.D0.B2.D0.B0.D1.8F_.D0.BF.D1.80.D0.BE.D0.BA.D1.80.D1.83.D1.82.D0.BA.D0.B0>.

* `0` — All Edges
* `1` — Top Edge
* `2` — Top Right Corner
* `3` — Right Edge
* `4` — Bottom Right Corner
* `5` — Bottom Edge
* `6` — Bottom Left Corner
* `7` — Left Edge
* `8` — Top Left Corner

#### Enable circular scrolling

      Option "CircularScrolling" "1"
      Option "CircScrollTrigger" "3"
    EndSection
