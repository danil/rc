# Character encoding conversion util rcc

## File content **TEXT**

    iconv --from-code=WINDOWS-1251 --to-code=UTF-8 --output=your_out_file your_in_file

## File **NAME**

    convmv -f windows-1251 -t utf-8 *.* --notest -r

## New **LINE**

Convert [newline][] [unix2dos][] `carriage return + line feed` to `line feed`.

    dos2unix your_file

[newline]:  https://en.wikipedia.org/wiki/Newline
[unix2dos]: https://en.wikipedia.org/wiki/Unix2dos
