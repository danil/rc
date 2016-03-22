# ag

The silver searcher <https://github.com/ggreer/the_silver_searcher>.

    ag Webpage ~/src/jobtest-aviasales-ru/

## Search for file name

    ag --all-types -g [a-z]+array

## Only print filenames containing matches

    ag --files-with-matches "{{" config/

## Color

Color line number

<https://github.com/ggreer/the_silver_searcher/issues/90>

    ag --color-line-number "2;31"
