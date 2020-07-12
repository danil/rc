# Archiving and compression

## tar read

    tar --list --file path/to/your.tar

## tar extract

    tar --extract --gzip --file path/to/your.tar.gz

## tar extract from stdin to stdout

Via pipeline

    cat file.tar.gz | tar --extract --gzip --to-stdout --file - | less

## tar create archive with exclusion

<http://stackoverflow.com/questions/984204/shell-command-to-tar-directory-excluding-certain-files-folders#984259>

    tar --exclude=foo.tar.xz --create --xz --file foo.tar.xz ./foo

## tar create archive by list of files

<http://stackoverflow.com/questions/8033857/tar-archiving-that-takes-input-from-a-list-of-files#8033891>

    tar --create --file foo.tar --files-from=mylist.txt

## tar create archive from stdin to stdout

<http://stackoverflow.com/questions/2597875/how-can-i-build-a-tar-from-stdin#14073550>

    find path/to/your/dir \
      | tar --create --to-stdout --files-from - \
      | gzip --compress \
      > path/to/file.tar.gz

## tar create archives of the each directory

    for i in *; do echo "$i" && tar cJf "$i.tar.xz" "$i"; done

## tar create archives by array of directories

```sh
read -ra arr <<<"your array of directories" && \
    for i in "${arr[@]}"; do \
        tar -cf "$i".tar "$i" && \
            mv "$i".tar "$i"_md5_$(md5sum "$i".tar | cut -d" " -f1).tar ; \
    done
```

## gzip decompress

    gzip --decompress --keep path/to/your.file.gz

## gzip decompress tarball

    tar --extract --gzip --file path/to/your.file.tar.gz

## gzip compress

    gzip --keep path/to/your.file
    gzip --keep --stdout path/to/your.file > path/to/your.file.gz

## pigz decompress tarball

<https://github.com/madler/pigz>

    pigz --decompress --stdout path/to/your.file.tar.gz | tar --extract --file -

## pigz compress tarball

    tar --use-compress-program="pigz --best --recursive" -cf path/to/your.file.tar.gz path/to/dir
    tar --create --file - path/to/dir | pigz --best > path/to/your.file.tar.gz

## bzip2 decompress

    bzip2 --decompress --keep path/to/your.file.bz2
    cat path/to/your.file.bz2 | bzip2 --decompress > path/to/file

## bzip2 decompress tarball

    tar --extract --bzip2 --file path/to/your/dir.tar.bz2

## bzip2 compress

    bzip2 --keep path/to/your.file
    bzip2 --keep --stdout path/to/your.file > path/to/your.file.bz2

## xz decompress

    xz --decompress --keep path/to/your.file.xz
    pg_dump db_name | xz --compress > path/to/dump_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz

## xz decompress tarball

    tar --extract --xz --file path/to/your.tar.xz

## xz compress

    xz --keep path/to/your.file
    xz --keep --stdout path/to/your.file > path/to/your.file.xz

## zstd decompress tarball

<https://github.com/facebook/zstd>

    tar --extract --zstd --file path/to/your.file.tar.zst
    zstd --threads=0 --force --decompress --stdout path/to/your.file.tar.zst | tar --extract --file -

## zstd compress tarball

    tar --create --zstd --file path/to/your.file.tar.zst path/to/dir
    tar --create --file - path/to/dir | zstd -10 --threads=0 --force --compress --stdout > path/to/your.file.tar.gz

## unzip decompress to directory

    unzip foo.zip -d path/to/directory

## zip decompress

    unzip -p path/to/file.zip | cat

## zip compress

    zip file-to-archive.zip file-to-archive
    echo 'Hello, World!' | zip file-to-archive.zip -
    zip --recurse-paths foo.zip foo/
    export f=filename && cat ${f} | zip --quiet ${f}.zip $f
    ls path/to/your.file | zip --quiet path/to/file.zip -@
    ls path/to/your/dir | grep filename | zip --quiet path/to/archive.zip -@

## zip ???

    export f=path/to/file && ls ${f} | zip --quiet ${f}.zip -@
    export p=path/to/dir && ls ${p}/nesteddir | grep re | zip --quiet ${p}/archive.zip -@

## funzip decompress

    cat archive.zip | funzip

## rar decompress

    unrar x file.rar
