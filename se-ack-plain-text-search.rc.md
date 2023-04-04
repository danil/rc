# [ack][] rc

    ack your-search-term path/to/your.file

[ack]: https://github.com/beyondgrep/ack3

## Search for file name

    ack --all-types -g [a-z]+array

## Only print filenames containing matches

    ack --files-with-matches "your-search-term" path/to/your.file
