# SFTP

## List files

    echo "ls" | sftp sftp://your_name@your.tld:2022/path/to/dir
    echo "ls path/to/dir" | sftp sftp://your_name@your.tld:2022/

## Make directory

    echo "mkdir path/to/dir" | sftp sftp://your_name@your.tld:2022/

## Download file

    echo "get file.name" | sftp sftp://your_name@your.tld:2022/

## Upload file

    echo "put file.name" | sftp sftp://your_name@your.tld:2022/path/to/dir

## Move/rename file

    echo "rename old.name new.name" | sftp sftp://your_name@your.tld:2022/path/to/dir

## Remove/delete

    echo "rm file.name" | sftp sftp://your_name@your.tld:2022/path/to/dir
