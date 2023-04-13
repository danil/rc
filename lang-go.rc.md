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

    func BenchmarkYourFunc(b *testing.B) {
        for i := 0; i < b.N; i++ {
            yourpkg.YourFunc()
        }
    }

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

## [Type conversion][]

    var i int = 42; f float64 = float(i)
    i := (*int)(nil)

[type conversion]: https://go.dev/ref/spec#Conversions

## [Type assertion][]

    var x interface{} = 42; i := x.(int)

[type assertion]: https://go.dev/ref/spec#Type_assertions

## Civil time vs monotonic

Arguments for `time.Time` type and against `time.Date` type
<https://github.com/golang/go/issues/19700#issuecomment-559250634>.

## Multiply duration

    fmt.Println(time.Duration(float64(42*time.Second) * 1.23))

## Duration growth logarithmically a-la exponential/expotential backoff

    for i := 1; i < 100500; i++ {
        d := time.Duration(float64(42*time.Second) * (1 + math.Log(float64(i))))
        if d > 3*time.Minute {
            d = 3 * time.Minute
        }
        time.Sleep(d)
    }

## [Fix timer reset deadlock][]

    timer.Stop()
    select {
    case <-timer.C:
    default:
    }
    timer.Reset(d)

[fix timer reset deadlock]: https://github.com/golang/go/issues/27169

## Regexp match string

    regexp.MustCompile("^[a-z]+$").MatchString("foo")

## Regexp multiline/new line

    regexp.MustCompile("(?m)^[a-z]*$\n[a-z]*").MatchString("foo\nxyz")

## Regexp replacement variable/submatch/capturing group

    regexp.MustCompile("(.{3})").ReplaceAll([]byte("foo3"), []byte("${1}12"))

## Three-index/primary/full slice

* https://go.dev/ref/spec#Slice_expressions
* https://docs.google.com/document/d/1GKKdiGYAghXRxC2BFrSEbHBZZgAGKQ-yXK-hRKBo0Kk/pub

For examle `a[low:high:max]` or `a[0:0:0]` or `a[:0:0]`

## Copy slice

* https://pkg.go.dev/builtin#copy
* https://pkg.go.dev/builtin#append
* https://github.com/golang/go/wiki/SliceTricks#copy

1. `b := make([]T, len(a))` and then `copy(b, a)`
2. `b := append(a[:0:0], a...)` is the same as `b = append([]T(nil), a...)`
3. `b := append(make([]T, 0, len(a)), a...)`

## Compare byte slices

`bytes.Compare` returns **0** if a == b, **-1** if a < b, and **+1** if a > b

    bytes.Compare([]byte{1,2}, []byte{3,4})

## Compare byte arrays

    a1, a2 := [2]byte{1, 2}, [2]byte{3, 4}
    fmt.Println(bytes.Compare(a1[:], a2[:]))

## Language/locale

* https://go.dev/blog/matchlang
* https://pkg.go.dev/golang.org/x/text/language

## Copy/clone/duplicate struct to struct of another type

https://pkg.go.dev/testing/fstest

```go
package main

import "github.com/jinzhu/copier"

type T1 struct {
    Name string
}

type T2 struct {
    Name string
    Age  int
}

func main() {
    t1 := T1{Name: "John Doe"}
    t2 := T2{Age: 42}
    if err := copier.Copy(&t2, &t1); err != nil {
        panic(err)
    }
}
```

## Context

1. [context.Context][]
2. [net.Context][] Is a former beta version.

[context.context]: https://pkg.go.dev/context
[net.context]: https://pkg.go.dev/golang.org/x/net/context

## Query string key-value pairs

[Query string][] of Uniform Resource Identifier URI encoded in
[application/x-www-form-urlencoded][] algorithm is a _sorted list_
of [name-value pair][]s implemented by [net/url][] package
encodes the values into URL encoded form _sorted by key_.

    v := url.Values{}
    v.Add("3", "xyz"); v.Add("1", "foo"); v.Add("2", "bar")
    fmt.Println(v.Encode()) // 1=foo&2=bar&3=xyz

<https://go.dev/play/p/gCRFEuO4CkC>

[application/x-www-form-urlencoded]: <http://w3.org/TR/html5/forms.html#application/x-www-form-urlencoded-encoding-algorithm>
[name-value pair]: https://en.wikipedia.org/wiki/Name-value_pair
[net/url]: <https://pkg.go.dev/net/url>
[query string]: <https://www.rfc-editor.org/rfc/rfc3986#section-3.4>

## JSON marshaling of map fields in sorted order

The Go standard library already preserves sorted order of map keys:

> The map keys are sorted
