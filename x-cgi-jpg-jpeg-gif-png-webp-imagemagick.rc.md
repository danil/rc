# [CGI][] ImageMagick rc

[cgi]: https://en.wikipedia.org/wiki/Computer-generated_imagery

## HOWTO: Install imagemagick 

    brew install imagemagick

## HOWTO: imagemagick: Convert JPG to GIF

    convert "your.png" "your.gif"

## HOWTO: imagemagick: Convert PNG to JPG

    convert /tmp/screenshot.png -quality 30 /tmp/screenshot.jpg

## HOWTO: imagemagick: Convert WebP to PNG <sup>[*][938666174]</sup>

    dwebp file.webp -o abc.png

[938666174]: http://unix.stackexchange.com/questions/70622/command-line-convert-webp-to-jpg#70673

## HOWTO: imagemagick: Taking screenshot <sup>[*][1470135740]</sup>

    sleep 5 && import -window root /tmp/screenshot.png

[1470135740]: https://wiki.archlinux.org/title/Taking_a_screenshot#ImageMagick.2FGraphicsMagick

## HOWTO: Install WebP

    brew install webp

## HOWTO: Convert PNG to WebP

    cwebp -q 60 path/to/your.png -o path/to/your.webp
