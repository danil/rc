# Golang rc

<https://go-proverbs.github.io>

## Environment

    go env

## Packages install

Get with all dependencies (exclude test dependencies)

    go get -v ./...

Get test dependencies

    go get -v -t ./...

## Package update

    go get -u your.tld/path/to/pkg

## Package dependencies list

List package dependencies

    go list -f '{{ .Deps }}' your.tld/path/to/pkg

## Package install

    go install your.tld/path/to/pkg

## Packages list

List installed packages
<https://golang.org/doc/articles/go_command.html>

    go list ./...

## Testing

* <https://blog.golang.org/examples>
* <https://blog.golang.org/subtests>

Run test suite

    go test -v your.tld/path/to/pkg
    go test -v ./...

## Test without cache

Disable test cache

<https://github.com/golang/go/issues/24573#issuecomment-393818160>

    go test -count=1

## Test benchmarks

Run benchmarks

    go test -v -bench=. -benchmem ./...

## Test coverage

[Test coverage](https://blog.golang.org/cover)

    go test -cover ./...

## Test races

Race conditions and [Race Detector](https://blog.golang.org/race-detector)

    go test -race ./...

## Table tests

Generator <https://github.com/cweill/gotests>

## Test file

https://pkg.go.dev/testing/fstest

```go
package main

import "testing/fstest"

func main() {
   m := fstest.MapFS{
      "hello.txt": {
         Data: []byte("hello, world"),
      },
   }
   b, e := m.ReadFile("hello.txt")
   if e != nil {
      panic(e)
   }
   println(string(b) == "hello, world")
}
```

## godef

Find function definition by package/function name
<https://godoc.org/github.com/rogpeppe/godef>

```sh
go get github.com/rogpeppe/godef
godef -f path/to/file.go 'yourpkgnm.YourFunctionNm'
```

## Build

    go build

## Build with custom executable name and custom output directory

    go build -o path/to/your/executable

## Build with directory change within go.mod

    cd path/to/go/mod/dir && go build

## Build cache invalidation

Invalidate cache/recompile

    go build -a path/to/package

## [Runtime][] [Gosched][]

[Runtime]: https://golang.org/pkg/runtime
[Gosched]: https://golang.org/pkg/runtime/#Gosched

Yields the processor, allowing other goroutines to run.  
It necessary for cooperative scheduler (кооперативного планировщика) until Go 1.13
and unnecessary for preemptive scheduler (вытесняющего планировщика) starts Go 1.14
<https://habr.com/ru/post/502506>.

    runtime.Gosched()

## [Runtime][] [GC][] disable

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

```bash
go build -ldflags "-X path/to/package.foo=$(git describe --abbrev=0 --tags) -X path/to/package.Bar=$(git rev-parse --short HEAD) -X path/to/package.baz=$(git rev-parse HEAD) -X path/to/package.qux=$(date --utc +%s) -X path/to/package.xyz=$(date --utc +%Y%m%dT%H%M%SZ)" main.go
go run -ldflags "-X path/to/package.foo=123 -X path/to/package.Bar=xyz" main.go
```

## Cross compilation

    env GOARCH=arm64 go build

## Civil time vs monotonic

Arguments against time.Date type <https://github.com/golang/go/issues/19700#issuecomment-559250634>

## Multiply duration

    fmt.Println(time.Duration(float64(42*time.Second) * 1.23))

## Duration growth logarithmically

    for i := 1; i < 100500; i++ {
        time.Duration(float64(42*time.Second) * (1 + math.Log(float64(i))))
    }

## Copy slice

https://github.com/golang/go/wiki/SliceTricks#copy

1. `b := make([]T, len(a))` and then `copy(b, a)`
2. `b := append(a[:0:0], a...)` is the same as `b = append([]T(nil), a...)`
3. `b := append(make([]T, 0, len(a)), a...)`
