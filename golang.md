# Go

## Environment

    go env

## Packages

### Install

Get with all dependencies

    go get -v ./...

### Update

    go get -u example.org/path/to/package

### Run tests

Run test suite

    go test -v ./...

### Run benchmarks

    go test -v -bench=.

### List package dependencies

    go list -f '{{ .Deps }}' example.org/path/to/package

### Other

    go install example.org/path/to/package

## List installed

<https://golang.org/doc/articles/go_command.html>

    go list ./...

## godef

Find function definition by package/function name
<https://godoc.org/github.com/rogpeppe/godef>

    godef -f path/to/file.go 'yourpackagename.YourFunctionName'

## Cache

Invalidate cache

    go build -a path/to/package

## [Runtime](https://golang.org/pkg/runtime)

### [Gosched](https://golang.org/pkg/runtime/#Gosched)

Yields the processor, allowing other goroutines to run.

    runtime.Gosched()

### [Debug](https://golang.org/pkg/runtime/debug)

#### [FreeOSMemory](https://golang.org/pkg/runtime/debug/#FreeOSMemory)

Forces a garbage collection followed by an attempt to return as much
memory to the operating system as possible.

    debug.FreeOSMemory()

## Reduce binary size

Minimize binary size

Maybe use `-s -w`?

    go build --ldflags "-s" path/to/package
    go run --ldflags "-s" path/to/package

## Compile time variables

Set some string variable on compile time (for example your some "version")

    go build -ldflags "-X main.yourVariable=`echo 'Your value'`" main.go
    go run -ldflags "-X main.foo=123 -X main.bar=xyz" main.go

## Cross compilation

    env GOARCH=arm64 go build
