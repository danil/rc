# [Go][] programming language <sup>[1][proverbs] [2][effective go]</sup> rc

[effective go]: https://go.dev/doc/effective_go
[go]: https://github.com/golang/go
[proverbs]: https://go-proverbs.github.io

## HOWTO Install by [Homebrew][]

    brew install go

[homebrew]: https://formulae.brew.sh/formula/go#default

## HOWTO [Hello, World!][]

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

```sh
$ go run ./...
Hello, World!
```

[hello, world!]: https://go.dev/doc/tutorial/getting-started#code

## HOWTO Environment

    go env

## DOC Books

* "The Go Programming Language" Alan A. A. Donovan, Brian W. Kernighan <sup>[*][629190432]</sup>

[629190432]: https://go.dev/learn/#featured-books

## HOWTO Packages install

Get with all dependencies (exclude test dependencies)

    go get -v ./...

Get test dependencies

    go get -v -t ./...

## HOWTO Package update

    go get -u your.tld/path/to/pkg

## HOWTO Package dependencies list

List package dependencies

    go list -f '{{ .Deps }}' your.tld/path/to/pkg

## HOWTO Package install

    go install your.tld/path/to/pkg

## HOWTO Packages list

List installed packages
<https://golang.org/doc/articles/go_command.html>

    go list ./...

## HOWTO Testing <sup>run test suite [2319142434][] [2570645731][]</sup>

    go test -v -race -count=1 your.tld/path/to/pkg
    go test -v -race -count=1 ./...

[2319142434]: https://blog.golang.org/examples
[2570645731]: https://blog.golang.org/subtests

## HOWTO Test without cache/disable test cache <sup>[4126800382][]</sup>

    go test -count=1

[4126800382]: https://github.com/golang/go/issues/24573#issuecomment-393818160

## HOWTO Test benchmarks <sup>run benchmarks</sup>

    cat go.mod

```
module yourpkg

require "your.tld/you/yourpkg" v0.0.0
replace "your.tld/you/yourpkg" v0.0.0 => "./"
```

    cat yourpkg.go

```go
package yourpkg

var hello string

func YourInit() { hello = "Hello" }

type T string

func New() T                   { return T(hello) }
func (x *T) YourFunc(s string) { *x = T(string(*x)[:len(hello)] + " " + s) }
func (x *T) YourReset()        { *x = T(string(*x)[:len(hello)]) }
```

    cat your_test.go

```go
package yourpkg_test

import (
	"fmt"
	"path/filepath"
	"runtime"
	"testing"

	"your.tld/you/yourpkg"
)

var tests = []struct {
	name string
	line string
	in   string
	out  string
}{
	{name: "test Alice", in: "Alice", out: "Hello Alice", line: line()},
	{name: "test Bob", in: "Bob", out: "Hello Bob", line: line()},
}

func line() string {
	_, file, line, ok := runtime.Caller(1)
	if ok {
		return fmt.Sprintf("%s:%d", filepath.Base(file), line)
	}
	return "it was not possible to recover file and line number information about function invocations"
}

func TestYourFunc(t *testing.T) {
	t.Parallel()

	yourpkg.YourInit()

	for _, tt := range tests {
		tt := tt

		t.Run(tt.line+"/"+tt.name, func(t *testing.T) {
			t.Parallel()

			in := yourpkg.New()
			in.YourFunc(tt.in)

			if string(in) != tt.out {
				t.Errorf("\nwant: %s\n got: %s", tt.out, in)
			}
		})
	}
}

func BenchmarkYourFunc(b *testing.B) {
	yourpkg.YourInit()

	b.ResetTimer()
	b.ReportAllocs()

	for _, tt := range tests {
		b.Run(tt.name, func(b *testing.B) {
			in := yourpkg.New()

			for i := 0; i < b.N; i++ {
				in.YourFunc(tt.in)
			}

			b.StopTimer()
			in.YourReset()
			b.StartTimer()
		})
	}
}
```

    go test -race -count=1 -bench=. -benchmem ./...

## HOWTO [Test coverage][]

    go test -cover ./...

[test coverage]: https://blog.golang.org/cover

## HOWTO Test races/race conditions and [Race Detector][]

    go test -race ./...

[race detector]: https://blog.golang.org/race-detector

## HOWTO Table tests

Generator <https://github.com/cweill/gotests>

## HOWTO Test: [fstest][]: Mocking relative path of file system <sup>[3825108315][] [1746671570][] [2434259655][] [1056894504][]</sup>

```go
package main

import "testing/fstest"

func main() {
   testFS := fstest.MapFS{
      "relative/path/to.file": {
         Data: []byte("Hello, world!"),
      },
   }
   p, err := testFS.ReadFile("relative/path/to.file")
   if err != nil {
      panic(err)
   }
   println(string(p) == "Hello, world!")
}
```

[fstest]: https://pkg.go.dev/testing/fstest
[1056894504]: https://github.com/spf13/afero
[1746671570]: https://github.com/golang/go/issues/44166
[2434259655]: https://github.com/golang/go/issues/51378#issuecomment-1053427475
[3825108315]: https://github.com/golang/go/issues/44279

## HOWTO [godef][]: Find function definition by package/function name

[godef]: https://godoc.org/github.com/rogpeppe/godef

```sh
go get github.com/rogpeppe/godef
godef -f path/to/file.go 'yourpkgnm.YourFunctionNm'
```

## HOWTO Build <sup>[4169212427][] [318174330][]</sup>

    CGO_ENABLED=0 go build

[318174330]:  https://stackoverflow.com/questions/36279253/go-compiled-binary-wont-run-in-an-alpine-docker-container-on-ubuntu-host#36308464
[4169212427]: https://stackoverflow.com/questions/64421305/heroku-go-app-crashes-version-glibc-2-32-not-found-required-by-bin-main#65919767

## HOWTO Build with custom executable name and custom output directory

    go build -o path/to/your/executable

## HOWTO Build with directory change within go.mod

    cd path/to/go/mod/dir && go build

## HOWTO Build cache invalidation

Invalidate cache/recompile

    go build -a path/to/package

## HOWTO [Runtime][] [Gosched][]

[Runtime]: https://golang.org/pkg/runtime
[Gosched]: https://golang.org/pkg/runtime/#Gosched

Yields the processor, allowing other goroutines to run.  
It necessary for cooperative scheduler (кооперативного планировщика) until Go 1.13
and unnecessary for preemptive scheduler (вытесняющего планировщика) starts Go 1.14
<https://habr.com/ru/post/502506>.

    runtime.Gosched()

## HOWTO [Runtime][] [GC][] disable

[GC]: https://golang.org/pkg/runtime/#hdr-Environment_Variables

<https://blog.golang.org/go15gc>

    GOGC=off

## HOWTO [Debug][] [FreeOSMemory][]

[Debug]: https://golang.org/pkg/runtime/debug
[FreeOSMemory]: https://golang.org/pkg/runtime/debug/#FreeOSMemory

Forces a garbage collection followed by an attempt to return as much
memory to the operating system as possible.

    debug.FreeOSMemory()

## HOWTO Reduce binary size<sup>minimize binary size</sup>

    go build --ldflags "-s -w" path/to/package
    go run --ldflags "-s -w" path/to/package

## HOWTO Compile time variables

Set some string variable on compile time (for example your some "version")

```bash
go build -ldflags "-X path/to/package.foo=$(git describe --abbrev=0 --tags) -X path/to/package.Bar=$(git rev-parse --short HEAD) -X path/to/package.baz=$(git rev-parse HEAD) -X path/to/package.qux=$(date --utc +%s) -X path/to/package.xyz=$(date --utc +%Y%m%dT%H%M%SZ)" main.go
go run -ldflags "-X path/to/package.foo=123 -X path/to/package.Bar=xyz" ./...
```

## HOWTO Cross compilation

    env GOARCH=arm64 go build

## DOC Package naming convention style

* [Effective Go Package names][]: By convention, packages are given lower case, single-word names; there should be no need for underscores or mixedCaps.
* [Code Review Package names][]
* [Go Blog Package names][]
* <https://talks.golang.org/2016/refactor.article#TOC_3.>

[code review package names]: https://go.dev/wiki/CodeReviewComments#package-names
[effective go package names]: https://go.dev/doc/effective_go#package-names
[go blog package names]: https://go.dev/blog/package-names

## DOC Code review bad/meaningless package name convention style

1. https://go.dev/doc/effective_go#package-names>
2. https://go.dev/blog/package-names#bad-package-names
3. https://github.com/golang/go/wiki/CodeReviewComments#package-names

Bad package name examples: `util`, `common` and `misc`

## HOWTO Code review [N characters line length convention][] style

80 characters or not?

[n characters line length convention]: http://github.com/golang/go/wiki/CodeReviewComments#line-length

## HOWTO Code review abbreviation [initialism convention][] style

For example: `Id` -> `ID` `Url` -> `URL` `Xml` -> `XML`

[initialism convention]: https://github.com/golang/go/wiki/CodeReviewComments#initialisms

## NOTE Code review the named return is good but the naked/bare return is bad convention style <sup>[1][named naked bare return issues 20859] [2][named naked bare return issues 21291] [3][named naked bare return]</sup>

[named naked bare return issues 20859]: https://github.com/golang/go/issues/20859
[named naked bare return issues 21291]: https://github.com/golang/go/issues/21291
[named naked bare return]: https://golang.org/s/style#named-result-parameters

## HOWTO [Type conversion][]

    var i int = 42; f float64 = float(i)
    i := (*int)(nil)

[type conversion]: https://go.dev/ref/spec#Conversions

## HOWTO [Type assertion][]

    var x interface{} = 42; i := x.(int)

[type assertion]: https://go.dev/ref/spec#Type_assertions

## HOWTO Non-nil interface type and nil interface value

    if i, ok := value.source.(fmt.Stringer); ok {
        if i == nil || (reflect.ValueOf(i).Kind() == reflect.Ptr && reflect.ValueOf(i).IsNil()) {
            return "This is real nil or nil value and non nil type."
        }
    }

## HOWTO Formatter

* <http://golang.org/pkg/fmt/#Formatter>
* <http://godoc.org/github.com/pkg/errors#Frame.Format>

    type Formatter interface {
            Format(f State, c rune)
    }

## HOWTO Error wrapping and formatting <sup>[*][1238582052] [*][2031092561] [*][2122683529]</sup>

    fmt.Errorf("your error: %w", errors.New("something went wrong"))

[1238582052]: https://pkg.go.dev/errors#pkg-overview
[2031092561]: https://pkg.go.dev/fmt#Errorf
[2122683529]: https://go.dev/blog/go1.13-errors#wrapping-errors-with-w

## DOC Common/sentinel error <sup>[564276647][] [3803648131][] [2964410316][] [1841971474][]</sup>

* [io.EOF][]                                      <sup>End of input</sup>
* [os.ErrPermission][]       [fs.ErrPermission][] <sup>Permission denied</sup>
* [os.ErrExist][]            [fs.ErrExist][]      <sup>File already exists</sup>
* [os.ErrNotExist][]         [fs.ErrNotExist][]   <sup>File does not exist</sup>
* [os.ErrClosed][]           [fs.ErrClosed][]     <sup>File already closed</sup>
* [os.ErrDeadlineExceeded][]                      <sup>I/O timeout</sup>

[fs.errclosed]: https://pkg.go.dev/io/fs#ErrClosed
[fs.errexist]: https://pkg.go.dev/io/fs#ErrExist
[fs.errnotexist]: https://pkg.go.dev/io/fs#ErrNotExist
[fs.errpermission]: https://pkg.go.dev/io/fs#ErrPermission
[io.eof]: https://pkg.go.dev/io#EOF
[os.errclosed]: https://pkg.go.dev/os#ErrClosed
[os.errdeadlineexceeded]: https://pkg.go.dev/os#ErrDeadlineExceeded
[os.errexist]: https://pkg.go.dev/os#ErrExist
[os.errnotexist]: https://pkg.go.dev/os#ErrNotExist
[os.errpermission]: https://pkg.go.dev/os#ErrPermission
[1841971474]: https://pkg.go.dev/fs#pkg-variables
[2964410316]: https://pkg.go.dev/os#pkg-variables
[3803648131]: https://pkg.go.dev/io#pkg-variables
[564276647]: https://dave.cheney.net/tag/errors

## HOWTO Explicit argument indexes of formatter

    fmt.Sprintf("%[2]d %[1]d", 11, 22)

## TROUBLESHOOTING Time type unification disclaimer (wall/civil/monotonic/absolute)

* Wall or Civil <sup>[*][2537165088] [arguments for `time.Time` type and against `time.Date` type][3612606115]</sup>
* Monotonic or Absolute <sup>[*][2825446405]</sup>

[2537165088]: https://en.wikipedia.org/wiki/Civil_time
[2825446405]: https://pkg.go.dev/time#hdr-Monotonic_Clocks
[3612606115]: https://github.com/golang/go/issues/19700#issuecomment-559250634

## HOWTO Multiply duration

    fmt.Println(time.Duration(float64(42*time.Second) * 1.23))

## HOWTO Duration growth logarithmically a-la exponential/expotential backoff

    for i := 1; i < 100500; i++ {
        d := time.Duration(float64(42*time.Second) * (1 + math.Log(float64(i))))
        if d > 3*time.Minute {
            d = 3 * time.Minute
        }
        time.Sleep(d)
    }

## HOWTO [Fix of timer reset deadlock][]

    timer := time.NewTimer(time.Second)
    timer.Stop()
    select {
    case <-timer.C:
    default:
    }
    timer.Reset(d)

[fix of timer reset deadlock]: https://github.com/golang/go/issues/27169

## HOWTO String [convertor to CamelCase][google.golang.org/protobuf]

    import "google.golang.org/protobuf/internal/strs"

    strs.GoCamelCase("text_2") // Text_2
    strs.GoCamelCase("text2")  // Text2

[google.golang.org/protobuf]: https://github.com/protocolbuffers/protobuf-go

## HOWTO Regexp match string

    regexp.MustCompile("^[a-z]+$").MatchString("foo")

## HOWTO Regexp multiline/new line

    regexp.MustCompile("(?m)^[a-z]*$\n[a-z]*").MatchString("foo\nxyz")

## HOWTO Regexp replacement variable/submatch/capturing group

    regexp.MustCompile("(.{3})").ReplaceAll([]byte("foo3"), []byte("${1}12"))

## HOWTO Three-index/primary/full slice

* https://go.dev/ref/spec#Slice_expressions
* https://docs.google.com/document/d/1GKKdiGYAghXRxC2BFrSEbHBZZgAGKQ-yXK-hRKBo0Kk/pub

For examle `a[low:high:max]` or `a[0:0:0]` or `a[:0:0]`

## HOWTO Copy slice

* https://pkg.go.dev/builtin#copy
* https://pkg.go.dev/builtin#append
* https://github.com/golang/go/wiki/SliceTricks#copy

1. `b := make([]T, len(a))` and then `copy(b, a)`
2. `b := append(a[:0:0], a...)` is the same as `b = append([]T(nil), a...)`
3. `b := append(make([]T, 0, len(a)), a...)`

## HOWTO Compare byte slices

`bytes.Compare` returns **0** if a == b, **-1** if a < b, and **+1** if a > b

    bytes.Compare([]byte{1,2}, []byte{3,4})

## HOWTO Compare byte arrays

    a1, a2 := [2]byte{1, 2}, [2]byte{3, 4}
    fmt.Println(bytes.Compare(a1[:], a2[:]))

## DOC Language/locale

* https://go.dev/blog/matchlang
* https://pkg.go.dev/golang.org/x/text/language

## HOWTO Copy/clone/duplicate struct to struct of another type

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

## DOC Context

1. [context.Context][]
2. [net.Context][] Is a former beta version.

[context.context]: https://pkg.go.dev/context
[net.context]: https://pkg.go.dev/golang.org/x/net/context

## HOWTO Query string key-value pairs

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

## DOC [JSON][] marshaling of map fields in sorted order

The Go standard library already preserves sorted order of map keys:

> The map keys are sorted

[json]: https://pkg.go.dev/encoding/json


## HOWTO [HTTP][] `multipart/form-data` `POST` of file by local path <sup>[*][multipart] [1102513506][] [1351755388][]</sup>

[1102513506]: https://github.com/curlconverter/curlconverter
[1351755388]: https://curlconverter.com/go
[http]: https://pkg.go.dev/net/http
[multipart]: https://pkg.go.dev/mime/multipart

    curl -X POST "https://your.tld/your/path" -H "Content-Type: multipart/form-data" -F "file=@/etc/hosts;filename=your.file;type=*/*" --basic --user your_user:your_password

```go
package main

import (
	"bytes"
	"fmt"
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"path/filepath"
)

func main() {
	form := new(bytes.Buffer)
	writer := multipart.NewWriter(form)
	fw, err := writer.CreateFormFile("file", filepath.Base("your.file"))
	if err != nil {
		log.Fatal(err)
	}

	fd, err := os.Open("/etc/hosts")
	if err != nil {
		log.Fatal(err)
	}
	defer fd.Close()

	_, err = io.Copy(fw, fd)
	if err != nil {
		log.Fatal(err)
	}

	writer.Close()

	client := &http.Client{}
	req, err := http.NewRequest("POST", "https://your.tld/your/path", form)
	if err != nil {
		log.Fatal(err)
	}

	req.Header.Set("Content-Type", writer.FormDataContentType())
	req.SetBasicAuth("your_user", "your_password")

	resp, err := client.Do(req)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	bodyText, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s\n", bodyText)
}
```
