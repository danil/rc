# [PCRE] [regexp][] rc

[pcre]: https://github.com/pcre2project/pcre2
[regexp]: https://en.wikipedia.org/wiki/Regular_expression

    brew install perl

## Find recourse

    pcre2grep -r your-regexp .

## Replace multiline

    perl -pi~ -0pe 's/foo.*?xyz/foo bar xyz/sm' path/to/your.file
