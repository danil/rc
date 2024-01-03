# [PCRE][] [regexp][] regular expression <sup>[1][foss] [2][proprietary]</sup> rc

[foss]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[pcre]: https://github.com/pcre2project/pcre2
[proprietary]: https://en.wikipedia.org/wiki/Proprietary_software
[regexp]: https://en.wikipedia.org/wiki/Regular_expression

## Positive lookahead

<http://regular-expressions.info/lookaround.html#lookahead>

    foo(?=bar)

## Negative lookahead

    foo(?!bar)

## Positive lookbehind

<http://regular-expressions.info/lookaround.html#lookbehind>

    (?<=bar)foo

## Negative lookbehind

    (?<!bar)foo

## Catastrophic backtracking

<http://stackoverflow.com/questions/8010005/python-re-infinite-execution>
<https://habrahabr.ru/post/131915/>

## Live evaluation/debug

1. https://regex101.com CONS: Proprietary.
2. https://regexr.com PROS: FOSS.
3. https://rubular.com
