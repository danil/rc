# Xfce

## Troubleshooting

# Disable window roll-up

Titlebar scroll transparency
<https://wiki.archlinux.org/index.php/Xfce#Disable_window_roll-up>.

    xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s false
