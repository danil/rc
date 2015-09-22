# ImageMagick

## Taking screenshot

<https://wiki.archlinux.org/index.php/Taking_a_screenshot#ImageMagick.2FGraphicsMagick>

    sleep 5 && import -window root /tmp/screenshot.png

## Convert png to jpg

    convert /tmp/screenshot.png -quality 30 /tmp/screenshot.jpg
