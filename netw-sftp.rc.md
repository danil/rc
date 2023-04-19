# SFTP rc

## List files

    echo "ls" | sftp sftp://your_nm@your.tld:2022/path/to/dir
    echo "ls path/to/dir" | sftp sftp://your_nm@your.tld:2022/

## Make directory

    echo "mkdir path/to/dir" | sftp sftp://your_nm@your.tld:2022/

## Download file

    echo "get file.nm" | sftp sftp://your_nm@your.tld:2022/

## Upload file

    echo "put file.nm" | sftp sftp://your_nm@your.tld:2022/path/to/dir

## Move/rename file

    echo "rename old.nm new.nm" | sftp sftp://your_nm@your.tld:2022/path/to/dir

## Rename/move directory

    echo "rename your-dir-nm your-dir-new-nm" | sftp sftp://your_nm@your.tld:2022/path/to/dir

## Remove/delete

    echo "rm file.nm" | sftp sftp://your_nm@your.tld:2022/path/to/dir
