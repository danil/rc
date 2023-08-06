# ImageMagick

## Taking screenshot

<https://wiki.archlinux.org/index.php/Taking_a_screenshot#ImageMagick.2FGraphicsMagick>

    sleep 5 && import -window root /tmp/screenshot.png

## Convert png to jpg

    convert /tmp/screenshot.png -quality 30 /tmp/screenshot.jpg

# WebP

## dwebp to png

<http://unix.stackexchange.com/questions/70622/command-line-convert-webp-to-jpg#70673>

    dwebp file.webp -o abc.png
