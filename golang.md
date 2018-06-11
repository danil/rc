# Go

## Environment

    go env

## Packages

### Install

Get with all dependencies

    go get -v ./...

### Update

    go get -u example.org/path/to/package

### Testsing

* <https://blog.golang.org/examples>
* <https://blog.golang.org/subtests>

#### Run

Run test suite

    go test -v example.org/path/to/package
    go test -v ./...

#### Benchmarks

Run benchmarks

    go test -v -bench=.

#### Run benchmarks

    go test -v -bench=.

#### Coverage

[Test coverage](https://blog.golang.org/cover)

    go test -cover ./...

#### Races

Race conditions and [Race Detector](https://blog.golang.org/race-detector)

    go test -race ./...

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

### [GC](https://golang.org/pkg/runtime/#hdr-Environment_Variables)

<https://blog.golang.org/go15gc>

#### Disable

    GOGC=off

### [Debug](https://golang.org/pkg/runtime/debug)

#### [FreeOSMemory](https://golang.org/pkg/runtime/debug/#FreeOSMemory)

Forces a garbage collection followed by an attempt to return as much
memory to the operating system as possible.

    debug.FreeOSMemory()

## Reduce binary size

Minimize binary size

    go build --ldflags "-s -w" path/to/package
    go run --ldflags "-s -w" path/to/package

## Compile time variables

Set some string variable on compile time (for example your some "version")

    go build -ldflags "-X main.yourVariable=`echo 'Your value'`" main.go
    go run -ldflags "-X main.foo=123 -X main.bar=xyz" main.go

## Cross compilation

    env GOARCH=arm64 go build
