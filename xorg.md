# X

# Restart

Restart X.

In a tty terminal, not a terminal window (get there with [Ctrl] +
[Alt] + [F1]).

    /etc/init.d/xdm stop

# Hardware information for VESA PnP monitors

    get-edid |parse-edid

# DPI

    xdpyinfo | grep "dots per inch"

# Display size

Display size (resolution)

    xdpyinfo | grep dimensions

# xautolock

    xautolock -disable

# xrandr

## Change monitor resolution

    xrandr
    xrandr -s 1440x900

### X screen go back to its normal resolution

<http://wiki.winehq.org/FAQ#head-acb200594b5bcd19722faf6fd34b60cc9c2f237b>

    xrandr -s 0

## Scale

Scale to virtual resolution

<http://unix.stackexchange.com/questions/69104/can-x11-scale-to-virtual-resoltions-on-hidpi-retina-screens-the-way-os-x-does#69109>

    xrandr --output LVDS-1 --scale 0.5x0.5

# Default applications

Open from console default application for file.
xdg-open desktop-independent and passes arguments to
gvfs-open, kde-open or exo-open respectively.

* <https://wiki.archlinux.org/index.php/Default_Applications>
* <https://wiki.archlinux.org/index.php/Xdg-open>

    xdg-open ~/Downloads/tasks.csv

# stdout to clipboard

<http://cyberciti.biz/faq/xclip-linux-insert-files-command-output-intoclipboard>.

    cat /var/tmp/portage/unity-base/bamf-0.2.118/temp/build.log | xsel

# GLX

OpenGL Extension to the X Window System

# Measure 3D performance

* <https://wiki.archlinux.org/index.php/Benchmarking#glxgears>
* <http://www.free3d.org/faq>

    glxgears


# Window Manager

## Change viewport

<http://superuser.com/questions/264281/wmctrl-says-i-have-one-workspace-when-i-actually-have-four#answer-264502>

Go to first viewport of current desktop

    wmctrl -o 0,0

## List the windows

    wmctrl -l

# notify-send

Show notificatioa (test x11-misc/dunst for example)
<https://wiki.archlinux.org/index.php/Desktop_notifications#Usage_in_programming>

    notify-send --urgency=low --hint=int:x:1390 --hint=int:y:800 --expire-time=900 '2' 'Desktop'

# Other

    echo "lalala" |xclip -selection clip
    echo -en "trulala" | xsel -i -b -p
    xev
    xset b off
    xrdb -merge ~/.Xresources
    xrdb -merge ~/.Xdefaults
    xinit `which nice` -n 1 `which wine` "./falloutw.exe" -- :1 -depth 16
    xclock &
    xdg-open micronika.xls
    xvidtune
    xdpyinfo |grep "depth of root"
    xrandr # .xinitc, .xsesson, .gnomerc
    gimptool-2.0 --install-script ~/Downloads/multiscale_0.scm
