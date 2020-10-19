# Go

<https://go-proverbs.github.io>

## Environment

    go env

## Packages install

Get with all dependencies (exclude test dependencies)

    go get -v ./...

Get test dependencies

    go get -v -t ./...

## Package update

    go get -u your.tld/path/to/package

## Package dependencies list

List package dependencies

    go list -f '{{ .Deps }}' your.tld/path/to/package

## Package install

    go install your.tld/path/to/package

## Packages list

List installed packages
<https://golang.org/doc/articles/go_command.html>

    go list ./...

## Testsing

* <https://blog.golang.org/examples>
* <https://blog.golang.org/subtests>

Run test suite

    go test -v your.tld/path/to/package
    go test -v ./...

## Test without cache

Disable test cache

<https://github.com/golang/go/issues/24573#issuecomment-393818160>

    go test -count=1

## Test benchmarks

Run benchmarks

    go test -v -bench=.

## Test coverage

[Test coverage](https://blog.golang.org/cover)

    go test -cover ./...

## Test races

Race conditions and [Race Detector](https://blog.golang.org/race-detector)

    go test -race ./...

## godef

Find function definition by package/function name
<https://godoc.org/github.com/rogpeppe/godef>

```sh
go get github.com/rogpeppe/godef
godef -f path/to/file.go 'yourpackagename.YourFunctionName'
```

## Build

    go build
    go build -o your_resulting_executable_name

## Build cache invalidation

Invalidate cache

    go build -a path/to/package

## [Runtime][] [Gosched][]

[Runtime]: https://golang.org/pkg/runtime
[Gosched]: https://golang.org/pkg/runtime/#Gosched

Yields the processor, allowing other goroutines to run.

    runtime.Gosched()

## [Runtime][] [GC][] Disable

[GC]: https://golang.org/pkg/runtime/#hdr-Environment_Variables

<https://blog.golang.org/go15gc>

    GOGC=off

## [Debug][] [FreeOSMemory][]

[Debug]: https://golang.org/pkg/runtime/debug
[FreeOSMemory]: https://golang.org/pkg/runtime/debug/#FreeOSMemory

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
