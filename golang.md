# Golang

## Environment

    go env

# Packages

## Install/update

### All dependencies

    go get -v ./...

### Update

    go get -u example.org/path/to/package

### Testing

    go test -v ./...

### Other

    go install example.org/path/to/package

## List installed

<https://golang.org/doc/articles/go_command.html>

    go list ./...

# Build

## Reduce binary size

    go build --ldflags "-s" path/to/package
