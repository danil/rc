# Non [PCRE][] [regexp][] grep rc

[pcre]: https://github.com/pcre2project/pcre2
[regexp]: https://en.wikipedia.org/wiki/Regular_expression

    grep --recursive --line-number eth0 /etc
    grep -irl danil . 2> /dev/null | xargs tar cvvf ~/tmp/123.tar

## Only names

    grep --files-with-matches --no-messages

## Select reverse/exclude/negative/non-matching lines

    grep -v foo.*bar
    grep --invert-match foo.*bar

## Recursive

    grep --recursive

## pcregrep

* Multiple lines matching
  <http://stackoverflow.com/questions/2686147/how-to-find-patterns-across-multiple-lines-using-grep#answer-2686705>
  <http://stackoverflow.com/questions/3863792/an-ack-or-grep-regex-to-match-two-lines-that-are-nearly-the-same#answer-3864440>
* Perl-compatible regexp

    pcregrep -rM 'class.*(\n|.)*class' lib/cda/

## fgrep

Searches by string as is

    fgrep string_to_find path/to/file
    grep --fixed-strings string_to_find path/to/file
