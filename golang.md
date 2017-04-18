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

# Linker

* <https://golang.org/cmd/link>
* <http://stackoverflow.com/questions/11354518/golang-application-auto-build-versioning#11355611>

## Reduce binary size

    go build --ldflags "-s" path/to/package
    go run --ldflags "-s" path/to/package

## Compile time variables

Set some string variable on compile time (for example your some "version")

    go build -ldflags "-X main.yourVariable=`echo 'Your value'`" main.go
    go run -ldflags "-X main.foo='bar'" main.go

# Location by IP

Find location (country, geographic coordinate, latitude/longitude) by IP

<https://github.com/oschwald/geoip2-golang>

# Web frameworks

Web frameworks and routers

## Comparsion

<https://github.com/diyan/go-web-framework-comparsion>

## Benchmarks

<https://github.com/julienschmidt/go-http-routing-benchmark>
