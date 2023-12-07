# [PCRE] [regexp][] regular expression rc

[pcre]: https://github.com/PCRE2Project/pcre2
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

1. https://regex101.com CONS: No source code (proprietary).
2. https://regexr.com
3. https://rubular.com
