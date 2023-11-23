# [CGI][] ImageMagick rc

[cgi]: https://en.wikipedia.org/wiki/Computer-generated_imagery

## Taking screenshot

<https://wiki.archlinux.org/index.php/Taking_a_screenshot#ImageMagick.2FGraphicsMagick>

    sleep 5 && import -window root /tmp/screenshot.png

## Convert PNG to JPG

    convert /tmp/screenshot.png -quality 30 /tmp/screenshot.jpg

## Convert WebP to PNG

<http://unix.stackexchange.com/questions/70622/command-line-convert-webp-to-jpg#70673>

    dwebp file.webp -o abc.png
