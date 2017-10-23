# Archiving and compression

## tar

### Read

    tar --list --file foobar.tar

### Extract

    tar --extract --gzip --file foobar.tar.gz

#### From stdin to stdout

Via pipeline

    cat file.tar.gz | tar --extract --gzip --to-stdout --file - | less

### Create

#### With exclude

<http://stackoverflow.com/questions/984204/shell-command-to-tar-directory-excluding-certain-files-folders#984259>

    tar --exclude=foo.tar.xz --create --xz --file foo.tar.xz ./foo

#### By list of files

<http://stackoverflow.com/questions/8033857/tar-archiving-that-takes-input-from-a-list-of-files#8033891>

    tar --create --file foo.tar --files-from=mylist.txt

#### From stdin to stdout

<http://stackoverflow.com/questions/2597875/how-can-i-build-a-tar-from-stdin#14073550>

    find path/to/dir \
      | tar --create --to-stdout --files-from - \
      | gzip --compress \
      > path/to/file.tar.gz

#### Each directory

    for i in *; do echo "$i" && tar cJf "$i.tar.xz" "$i"; done

#### By array of directories

```sh
read -ra arr <<<"your array of directories" && \
    for i in "${arr[@]}"; do \
        tar -cf "$i".tar "$i" && \
            mv "$i".tar "$i"_md5_$(md5sum "$i".tar | cut -d" " -f1).tar ; \
    done
```

## gzip

    gzip --keep access.log
    gzip --decompress access.log.gz
    tar --verbose --extract --gzip --file foobar.tar.gz

## bzip2

    bzip2 --verbose access.log
    bzip2 --verbose --decompress access.log.bz2
    tar --verbose --extract --bzip2 --file foobar.tar.bz2
    cat file.bz2 | bzip2 --decompress > path/to/file

## xz

    xz access.log
    xz --decompress access.log.xz
    tar --extract --xz --file foobar.tar.xz
    pg_dump db_name | xz --compress > path/to/dump_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz

## Zip

    zip file-to-archive.zip file-to-archive
    zip --recurse-paths foo.zip foo/

### Create

    export f=filename && cat ${f} | zip --quiet ${f}.zip $f
    ls path/to/file | zip --quiet path/to/file.zip -@
    ls path/to/dir | grep filename | zip --quiet path/to/archive.zip -@

### Unzip to directory

    unzip foo.zip -d path/to/directory

## funzip

    cat archive.zip | funzip

## RAR

    unrar x file.rar
