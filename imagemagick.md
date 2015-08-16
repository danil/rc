# ImageMagick

## Taking screenshot

<https://wiki.archlinux.org/index.php/Taking_a_screenshot#Screenshot_of_multiple_X_screens>

    sleep 5 && import -window root /tmp/screenshot.jpg

## Convert png to jpg

    convert /tmp/screenshot.png -quality 30 /tmp/screenshot.jpg
