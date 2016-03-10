# Archiving and compression

## tar

### Read

    tar --list --file foobar.tar

### Extract

    tar --extract --gzip --file foobar.tar.gz

#### From stdin/pipeline

    cat file.tar.gz | tar xzf -

### Create

#### With exclude

<http://stackoverflow.com/questions/984204/shell-command-to-tar-directory-excluding-certain-files-folders#984259>

    tar --exclude=foo.tar.xz --create --xz --file foo.tar.xz ./foo

#### By list of files

<http://stackoverflow.com/questions/8033857/tar-archiving-that-takes-input-from-a-list-of-files#8033891>

    tar --create --file foo.tar --files-from=mylist.txt

## gzip

    gzip --verbose access.log
    gzip --decompress access.log.gz
    tar --verbose --extract --gzip --file foobar.tar.gz

## bzip2

    bzip2 -v access.log
    bzip2 -vd access.log.bz2
    tar --verbose --extract --bzip2 --file foobar.tar.bz2

## xz

    xz access.log
    xz --decompress access.log.xz
    tar --extract --xz --file foobar.tar.xz
    pg_dump db_name | xz --compress > path/to/dump_$(date +%Y%m%d%H%M%S).sql.xz

## Zip

    zip file-to-archive.zip file-to-archive
    zip --recurse-paths foo.zip foo/

### Unzip to directory

    unzip foo.zip -d path/to/directory

## funzip

    cat archive.zip | funzip

## RAR

    unrar x file.rar
