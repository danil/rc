# ag rc

The silver searcher <https://github.com/ggreer/the_silver_searcher>.

## Install/compile/build

https://github.com/ggreer/the_silver_searcher#building-from-source

    make clean \
    ; git clean -d -X --force \
    && ./build.sh --prefix="$HOME"/.local/usr/local \
    && make install

## Search

    ag your-search-text path/to/your/dir

## Search for file name

    ag --all-types -g [a-z]+array

## Only print filenames containing matches

    ag --files-with-matches "{{" config/

## Color

Color line number

<https://github.com/ggreer/the_silver_searcher/issues/90>

    ag --color-line-number "2;31"
