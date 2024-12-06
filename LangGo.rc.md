# [Go][] programming language <sup><sub>[Stdlib][] [Proverbs][] [Effective Go][]</sub></sup> rc

[effective go]: https://go.dev/doc/effective_go
[go]: https://github.com/golang/go
[proverbs]: https://go-proverbs.github.io
[stdlib]: https://pkg.go.dev/std "Standard library."

* HOWTO Install `brew install go` <sup><sub>[Homebrew][]</sub></sup>
*   DOC Package name convention are given lower case, single-word names; there should be no need for underscores or mixedCaps. <sup><sub>Naming convention style [Effective Go Package names][2797441528] [Code Review Package names][186063190] [Go Blog Package names][3329569429] [4282605948][]</sub></sup>
*   DOC Interface name convention use an -er suffix: Reader, Writer, Formatter, CloseNotifier etc. <sup><sub>Naming convention style [2453223740][]</sub></sup>
* HOWTO Environment `go env`
*   DOC Book "The Go Programming Language" Alan A. A. Donovan, Brian W. Kernighan <sup><sub>[*][629190432]</sub></sup>
* HOWTO Install package `go get -v ./...` <sup><sub>Get with all dependencies (exclude test dependencies).</sub></sup>
* HOWTO Install package with test dependencies `go get -v -t ./...` <sup><sub>Get test dependencies.</sub></sup>
* HOWTO Update package `go get -u your.tld/path/to/pkg`
* HOWTO Package dependencies list `go list -f '{{ .Deps }}' your.tld/path/to/pkg` <sup><sub>List package dependencies</sub></sup>
* HOWTO Install package `go install your.tld/path/to/pkg`
* HOWTO List packages `go list ./...` <sup><sub>List installed packages. [557989519][]</sub></sup>
* HOWTO Testing `go test -v -race -count=1 ./...` <sup><sub>Run test suite [2319142434][] [2570645731][]</sub></sup>
* HOWTO Testing of remote package `go test your.tld/path/to/pkg`
* HOWTO Testing without cache `go test -count=1` <sup><sub>Testing with cache disabled. [4126800382][]</sub></sup>
* HOWTO VER2 Test benchmark `go test -race -count=1 -bench=. -benchmem ./...` <sup><sub>Run benchmark.</sub></sup>
* HOWTO Test coverage `go test -cover ./...` <sup><sub>[2445429477][]</sub></sup>
* HOWTO `go test -race ./...` <sup><sub>Test races/race condition/with race detector. [1720623323][]</sub></sup>
* HOWTO [Table test generator][1563123227]
* HOWTO [godef finds function definition][3825457580] `go get github.com/rogpeppe/godef && godef -f path/to/file.go 'yourpkgnm.YourFnNm'` <sup><sub>Find function definition by package and function name.</sub></sup>
* HOWTO Run `go run ./...`
* HOWTO Get [build ID][buildid] `go tool buildid path/to/your/file` <sup><sub>Display or update the build ID stored in a Go package or binary.</sub></sup>
* HOWTO Build `CGO_ENABLED=0 go build ./...` <sup><sub>[4169212427][] [318174330][]</sub></sup>
* HOWTO Build custom name `go build -o path/to/your/executable` <sup><sub>Build with custom executable name and custom output directory.</sub></sup>
* HOWTO Build without cache `go build -a path/to/your/package` <sup><sub>Build cache invalidation. Invalidate cache. Recompile.</sub></sup>
* HOWTO [Runtime][] [Gosched][] `runtime.Gosched()` <sup><sub>Yields the processor, allowing other goroutines to run. It necessary for cooperative scheduler (кооперативного планировщика) until Go 1.13 and unnecessary for preemptive scheduler (вытесняющего планировщика) starts Go 1.14. [3989277831][]</sub></sup>
* HOWTO [Runtime][] [GC][2736769797] disable `GOGC=off` <sup><sub>[269738468][]</sub></sup>
* HOWTO [Debug][] [FreeOSMemory][] `debug.FreeOSMemory()` <sup><sub>Forces a garbage collection followed by an attempt to return as much memory to the operating system as possible.</sub></sup>
* HOWTO Reduce binary size while build `go build --ldflags "-s -w" path/to/package` <sup><sub>Minimize binary size.</sub></sup>
* HOWTO Reduce binary size while run `go run --ldflags "-s -w" path/to/package` <sup><sub>Minimize binary size.</sub></sup>
* HOWTO Compile time variables while build `go build -ldflags "-X path/to/package.foo=$(git describe --abbrev=0 --tags) -X path/to/package.Bar=$(git rev-parse --short HEAD) -X path/to/package.baz=$(git rev-parse HEAD) -X path/to/package.qux=$(date --utc +%s) -X path/to/package.xyz=$(date --utc +%Y%m%dT%H%M%SZ)" main.go` <sup><sub>Set some string variable on compile time (for example your some "version").</sub></sup>
* HOWTO Compile time variables while run `go run -ldflags "-X path/to/package.foo=123 -X path/to/package.Bar=xyz" ./...` <sup><sub>Set some string variable on compile time (for example your some "version").</sub></sup>
* HOWTO Cross compilation `env GOARCH=arm64 go build`
* HOWTO Code review: [80 characters or not?][3571357994] <sup><sub>Code review: N characters line length convention style.</sup></sub>
* HOWTO Code review: [Initialism convention][91357513] `Id`->`ID` `Url`->`URL` `Xml`->`XML` and so on <sup><sub>Code review abbreviation style.</sub></sup>
* HOWTO Code review: The named return is good but the naked is bad <sup><sub>Convention style. Bare return is bad. [1][3699179768] [2][3409454453] [3][3137909250]</sub></sup>
* HOWTO [Type conversion][] `var i int = 42; f float64 = float(i); i := (*int)(nil)` <sup><sub>Example.</sub></sup>
* HOWTO [Type assertion][] `var x interface{} = 42; i := x.(int)` <sup><sub>Example.</sub></sup>
*   DOC [Generic][] type <sup><sub>[Intro generics since 1.18][127187619]. [When generics][4252385712]. [Example][3349214068][].</sub></sup>
* HOWTO Dave Cheney: *"accept interfaces, return structs"* <sup><sub>[991876724][] Jack Lindamood: "A great rule of thumb for Go is accept interfaces, return structs." Cite. </sub></sup>
* HOWTO Non-nil interface type and nil interface value `if i, ok := value.source.(fmt.Stringer); ok {; if i == nil || (reflect.ValueOf(i).Kind() == reflect.Ptr && reflect.ValueOf(i).IsNil()) {; return "This is real nil or nil value and non nil type."; }; }`
* HOWTO Print [Formatter][] `type Formatter interface {; Format(f State, c rune); }` <sup><sub>[99610387][]</sub></sup>
* HOWTO Print [Structured logging][slog] <sup><sub>Printing. Logging. [Structured logging blog article][2384274408]</sub></sup>
* HOWTO Print [Go-cmp][] compare values `cmp.Equal(your_val1, your_val2)` and `cmp.Diff(your_val1, your_val2)` <sup><sub> Printing. Logging. Check equality or difference. `ignore := []cmp.Option{cmpopts.IgnoreFields(yourpkg.YourType{}, "YourFld1", "YourFld1")}; if !cmp.Equal(got, want, ignore...) { t.Errorf("\nyour diff:\n%s\ntest: %s", cmp.Diff(want, got, ignore...), "path/to/your_test.go:42") }` [GitLab uses go-cmp too](https://docs.gitlab.com/ee/development/go_guide/#test-diffs). [Dave Cheney uses cmp too](https://dave.cheney.net/practical-go/presentations/gophercon-singapore-2019.html). Testing. Debuging. Compare difference. Pretty print.</sub></sup>
* HOWTO Print [Proto equal][proto] `proto.Equal(your_proto1, your_proto2)` <sup><sub>Printing. Logging. Check equality. Testing. Debugging. [DeepEqual][2542058847] </sub></sup>
* HOWTO Print [Proto diff](https://google.golang.org/protobuf/testing/protocmp) `cmp.Diff(your_proto1, your_proto2, protocmp.Transform())` <sup><sub>Printing. Logging. Check difference. Testing. Debugging. [DeepEqual][2542058847]</sub></sup>
* HOWTO Print [Error diff][cmpopts] `cmp.Diff(your_error1, your_error2, cmpopts.EquateErrors())`  <sup><sub>Printing. Logging. Check difference. Testing. Debugging.</sub></sup>
* HOWTO Error wrap format join `errors.Join(fmt.Errorf("your error: %w", errors.New("foo")), errors.New("bar"))` <sup><sub>Wrapping. Formatting. Joining. [1238582052][] [2031092561][] [2122683529][]</sub></sup>
* HOWTO Error unwrap and compare `func equal(err, err2 error) bool { if err == err2 { return true }; if err := errors.Unwrap(err); err != nil { if ok := equal(err, err2); ok { return true } }; if v, ok := err.(interface{ Unwrap() []error }); ok { for _, err := range v.Unwrap() { if ok := equal(err, err2); ok { return true } } }; return false }` <sup><sub>The example `equal` fn compares the wrapped errors recursively. [1121809002][].</sub></sup>
*   DOC Sentinel is a `sentinel error` <sup><sub>[Working with Errors in Go 1.13][1746613335] [Dave Cheney, Sentinel error][4005296955] [Error Inspection Draft Design 2018-08-27 Damien Neil][2397977476]</sub></sup>
*   DOC Sentinel [io.EOF][]                                      <sup><sub>End of input. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrInvalid][]          [fs.ErrInvalid][]    <sup><sub>Invalid argument. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrPermission][]       [fs.ErrPermission][] <sup><sub>Permission denied. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrExist][]            [fs.ErrExist][]      <sup><sub>File already exists. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrNotExist][]         [fs.ErrNotExist][]   <sup><sub>File does not exist. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrClosed][]           [fs.ErrClosed][]     <sup><sub>File already closed. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrNoDeadline][]                            <sup><sub>File type does not support deadline. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [os.ErrDeadlineExceeded][]                      <sup><sub>I/O timeout. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [sql.ErrNoRows][]                               <sup><sub>No rows in result set. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [sql.ErrNoRows][]                               <sup><sub>No rows in result set. Common error. [564276647][]</sub></sup>
*   DOC Sentinel [fs.PathError][] <sup><sub>[1595088486][]</sub></sup>
*   DOC Sentinel [fs.PathError][] `if e, ok := err.(*fs.PathError); ok { e.Timeout() }` or [url.Error][] `if e, ok := err.(*url.Error); ok { e.Timeout() }` or in general `if e, ok := err.(interface{ Timeout() bool }); ok { e.Timeout() }` <sup><sub>[1595088486][]</sub></sup>
*   DOC Sentinel [url.InvalidHostError][] is a `string error`.
* HOWTO Explicit argument indexes of formatter `fmt.Sprintf("%[2]d %[1]d", 11, 22)`
* HOWTO Create dir or append file if _, err := os.Stat("your.f"); errors.Is(err, os.ErrNotExist) { _ = os.MkdirAll(filepath.Dir("your.f"), os.ModePerm) }; f, _ := os.OpenFile("your.f", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644); defer f.Close(); _, _ = f.Write([]byte("Hello, World!")) <sup><sub>Create or update/append file after create directory if not exist. [2502395997][] [3382294025][]</sub></sup>
* HOWTO Create temp file VER2 `dirNm := filepath.Join(os.TempDir(), "your_dir"); _ = os.MkdirAll(dirNm, os.ModePerm); fileNm := filepath.Join(dirNm, "file_nm"+itoa.Uitoa(rand.Uint64())); f, _ := os.Create(fileNm); defer f.Close(); _, _ = f.Write([]byte("foo bar"))` <sup><sub>Create temporary file.</sub></sup>
* HOWTO Create temp file VER1 `f, _ := os.CreateTemp(filepath.Join(os.TempDir(), "your_dir"), "your_prefix_"); defer f.Close(); _, _ = f.Write([]byte("foo"))` <sup><sub>Create temporary file.</sub></sup>
* HOWTO Create temp dir VER2 `_ = os.MkdirAll(filepath.Join(os.TempDir(), "your_dir"), os.ModePerm)` <sup><sub>Create temporary directory. Function `os.MkdirTemp` just like DEPRECATED `ioutil.TempDir`.</sub></sup>
* HOWTO Create temp dir VER1 `d, _ := os.MkdirTemp("", "your_prefix_"); defer os.RemoveAll(d)` <sup><sub>Create temporary directory.</sub></sup>
* HOWTO Read all bytes `var bbytes.Buffer; io.Copy(&b r); fmt.Println("%s", b.String())` <sup><sub>Function `io.Copy` just like DEPRECATED `ioutil.ReadAll`.</sub></sup>
* HOWTO `paths, err := filepath.Glob(pattern)` <sup><sub>[Globbing][1331922473] pattern sets of filenames with [wildcard characters][3498575828].</sub></sup>
* HOWTO [Flag][] [Kong][] is a multi command command-line parser an alternative to using [flag.FlagSet][] <sup><sub> PROS: [Passthrough argument][2344166053]. [3264233233][] NOTE: Console. Terminal.</sub></sup>
* HOWTO VER1 [Flag][] [Flag set][flag.FlagSet] command-line parser allow multi command <sup><sub>In case you can't use, for example, [Kong][]. Console. Terminal.</sub></sup>

[buildid]: https://pkg.go.dev/cmd/buildid
[cmpopts]: https://github.com/google/go-cmp/cmp/cmpopts
[debug]: https://pkg.go.dev/runtime/debug
[flag.FlagSet]: https://pkg.go.dev/flag#FlagSet
[flag]: https://pkg.go.dev/flag
[formatter]: https://pkg.go.dev/fmt#Formatter
[freeosmemory]: https://pkg.go.dev/runtime/debug#FreeOSMemory
[fs.ErrInvalid]: https://pkg.go.dev/io/fs#ErrInvalid
[fs.errclosed]: https://pkg.go.dev/io/fs#ErrClosed
[fs.errexist]: https://pkg.go.dev/io/fs#ErrExist
[fs.errnotexist]: https://pkg.go.dev/io/fs#ErrNotExist
[fs.errpermission]: https://pkg.go.dev/io/fs#ErrPermission
[fs.patherror]: https://pkg.go.dev/io/fs#PathError
[fstest]: https://pkg.go.dev/testing/fstest
[generic]: https://go.dev/doc/tutorial/generics
[go-cmp]: https://github.com/google/go-cmp
[gosched]: https://pkg.go.dev/runtime#Gosched
[homebrew]: https://formulae.brew.sh/formula/go#default
[io.eof]: https://pkg.go.dev/io#EOF
[kong]: https://github.com/alecthomas/kong
[os.ErrInvalid]: https://pkg.go.dev/os#ErrInvalid
[os.ErrNoDeadline]: https://pkg.go.dev/os#ErrNoDeadline
[os.errclosed]: https://pkg.go.dev/os#ErrClosed
[os.errdeadlineexceeded]: https://pkg.go.dev/os#ErrDeadlineExceeded
[os.errexist]: https://pkg.go.dev/os#ErrExist
[os.errnotexist]: https://pkg.go.dev/os#ErrNotExist
[os.errpermission]: https://pkg.go.dev/os#ErrPermission
[proto]: https://pkg.go.dev/google.golang.org/protobuf/proto
[runtime]: https://pkg.go.dev/runtime
[slog]: https://pkg.go.dev/log/slog "Structured logging"
[sql.errnorows]: https://pkg.go.dev/database/sql#ErrNoRows
[type assertion]: https://go.dev/ref/spec#Type_assertions
[type conversion]: https://go.dev/ref/spec#Conversions
[url.error]: https://pkg.go.dev/net/url#Error
[url.invalidhosterror]: https://pkg.go.dev/net/url#InvalidHostError
[1056894504]: https://github.com/spf13/afero
[1121809002]: https://reddit.com/r/golang/comments/172rj7h "What is the rationale for not providing errors Unwrap []error?"
[1238582052]: https://pkg.go.dev/errors#pkg-overview
[127187619]: https://go.dev/blog/intro-generics "Intro generics since 1.18"
[1331922473]: https://en.wikipedia.org/wiki/Glob_(programming) "Globbing."
[1469759186]: https://github.com/alecthomas/kong/issues/72 "Difference between Kong and Cobra and Kingpin."
[1563123227]: https://github.com/cweill/gotests
[1595088486]: https://pkg.go.dev/os#PathError
[1642752273]: https://stackoverflow.com/questions/24504024/defining-independent-flagsets-in-golang#24510031 "Multi flag.FlagSet"
[1720623323]: https://go.dev/blog/race-detector
[1746613335]: https://go.dev/blog/go1.13-errors "Working with Errors in Go 1.13"
[1746671570]: https://github.com/golang/go/issues/44166
[186063190]: https://go.dev/wiki/CodeReviewComments#package-names "Code Review Package names"
[2031092561]: https://pkg.go.dev/fmt#Errorf
[2122683529]: https://go.dev/blog/go1.13-errors#wrapping-errors-with-w
[2319142434]: https://blog.golang.org/examples
[2344166053]: https://github.com/alecthomas/kong#supported-tags "Passthrough argument."
[2384274408]: https://go.dev/blog/slog "Structured logging"
[2397977476]: https://go.googlesource.com/proposal/+/master/design/go2draft-error-inspection.md "Error Inspection Draft Design 2018-08-27 Damien Neil"
[2434259655]: https://github.com/golang/go/issues/51378#issuecomment-1053427475
[2445429477]: https://go.dev/blog/cover
[2453223740]: https://go.dev/doc/effective_go#interface-names
[2502395997]: https://pkg.go.dev/os#example-OpenFile-Append
[2542058847]: https://protobuf.dev/reference/go/faq/#deepequal
[2570645731]: https://blog.golang.org/subtests
[269738468]: https://go.dev/blog/go15gc
[2736769797]: https://pkg.go.dev/runtime#hdr-Environment_Variables
[2797441528]: https://go.dev/doc/effective_go#package-names "Effective Go Package names"
[3137909250]: https://go.dev/wiki/CodeReviewComments#named-result-parameters "Named naked bare return."
[318174330]:  https://stackoverflow.com/questions/36279253/go-compiled-binary-wont-run-in-an-alpine-docker-container-on-ubuntu-host#36308464
[3264233233]: https://github.com/alecthomas/kong/discussions/336#discussioncomment-3809634 "Setting default file configuration values by `BeforeResolve` hook function."
[3329569429]: https://go.dev/blog/package-names "Go Blog Package names"
[3349214068]: https://github.com/mattn/go-generics-example
[3382294025]: https://stackoverflow.com/questions/12518876/how-to-check-if-a-file-exists-in-go#12518877
[3409454453]: https://github.com/golang/go/issues/21291 "Named naked bare return issues 21291."
[3498575828]: https://en.wikipedia.org/wiki/Wildcard_character
[3571357994]: https://go.dev/wiki/CodeReviewComments#line-length
[3699179768]: https://github.com/golang/go/issues/20859 "Named naked bare return issues 20859."
[3825108315]: https://github.com/golang/go/issues/44279
[3825457580]: https://pkg.go.dev/github.com/rogpeppe/godef
[3989277831]: https://habr.com/ru/post/502506
[4005296955]: https://dave.cheney.net/2016/04/27/dont-just-check-errors-handle-them-gracefully "Dave Cheney, Sentinel error"
[4126800382]: https://github.com/golang/go/issues/24573#issuecomment-393818160
[4169212427]: https://stackoverflow.com/questions/64421305/heroku-go-app-crashes-version-glibc-2-32-not-found-required-by-bin-main#65919767
[4252385712]: https://go.dev/blog/when-generics
[4282605948]: https://go.dev/talks/2016/refactor.article
[557989519]: https://golang.org/doc/articles/go_command.html
[564276647]: https://dave.cheney.net/tag/errors
[629190432]: https://go.dev/learn/#featured-books
[91357513]: https://go.dev/wiki/CodeReviewComments#initialisms
[991876724]: https://dave.cheney.net/2016/08/20/solid-go-design
[99610387]: https://pkg.go.dev/github.com/pkg/errors#Frame.Format

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

## HOWTO VER1 Test benchmark <sup><sub>run benchmarks</sub></sup>

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

func New() T                 { return T(hello) }
func (x *T) YourFn(s string) { *x = T(string(*x)[:len(hello)] + " " + s) }
func (x *T) YourReset()      { *x = T(string(*x)[:len(hello)]) }
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
	if _, file, line, ok := runtime.Caller(1); ok {
		return fmt.Sprintf("%s:%d", filepath.Base(file), line)
	}
	return "it was not possible to recover file and line number information about function invocations"
}

func TestYourFn(t *testing.T) {
	t.Parallel()

	yourpkg.YourInit()

	for _, tt := range tests {
		tt := tt

		t.Run(tt.line+"/"+tt.name, func(t *testing.T) {
			t.Parallel()

			in := yourpkg.New()
			in.YourFn(tt.in)

			if string(in) != tt.out {
				t.Errorf("\nwant: %s\n got: %s", tt.out, in)
			}
		})
	}
}

func BenchmarkYourFn(b *testing.B) {
	yourpkg.YourInit()

	b.ResetTimer()
	b.ReportAllocs()

	for _, tt := range tests {
		b.Run(tt.name, func(b *testing.B) {
			in := yourpkg.New()

			for i := 0; i < b.N; i++ {
				in.YourFn(tt.in)
			}

			b.StopTimer()
			in.YourReset()
			b.StartTimer()
		})
	}
}
```

    go test -race -count=1 -bench=. -benchmem ./...

## HOWTO Test: [fstest][]: Mocking relative path of file system <sup><sub>[3825108315][] [1746671570][] [2434259655][] [1056894504][]</sub></sup>

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

## DOC Code review bad/meaningless package name convention style

1. https://go.dev/doc/effective_go#package-names>
2. https://go.dev/blog/package-names#bad-package-names
3. https://github.com/golang/go/wiki/CodeReviewComments#package-names

Bad package name examples: `util`, `common` and `misc`

## TROUBLESHOOTING Time type unification disclaimer (wall/civil/monotonic/absolute)

* Wall or Civil <sup><sub>[*][2537165088] [arguments for `time.Time` type and against `time.Date` type][3612606115]</sub></sup>
* Monotonic or Absolute <sup><sub>[*][2825446405]</sub></sup>

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

* https://go.dev/wiki/SliceTricks#copy
* https://pkg.go.dev/builtin#copy
* https://pkg.go.dev/builtin#append
* DEPRECATED https://github.com/golang/go/wiki/SliceTricks#copy

1. `b := append(a[:0:0], a...)` is the same as `b = append([]T(nil), a...)`
2. `b := make([]T, len(a))` and then `copy(b, a)`
3. `b := append(make([]T, 0, len(a)), a...)`

## HOWTO Compare byte slices

`bytes.Compare` returns **0** if a == b, **-1** if a < b, and **+1** if a > b

    bytes.Compare([]byte{1,2}, []byte{3,4})

## HOWTO Compare byte arrays

    a1, a2 := [2]byte{1, 2}, [2]byte{3, 4}
    fmt.Println(bytes.Compare(a1[:], a2[:]))

## HOWTO `/dev/null` `io.Copy(io.Discard, strings.NewReader("Hello, World!"))`

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

## HOWTO VER2 [Flag][] [Flag set][flag.FlagSet] <sup><sub>Multi command and [Multi flag.FlagSet][1642752273] in case you can't use, for example, [Kong][]. Console. Terminal.</sub></sup>

```go
package main

import (
	"fmt"
	"flag"
	"os"
)

func main() {
	switch os.Args[1] {
	case "foo":
		set := flag.NewFlagSet("foo", flag.ExitOnError)
		bar := set.Bool("bar", false, "")
		_ = set.Parse(os.Args[2:])
		fmt.Println(*bar)
	case "xyz":
		set := flag.NewFlagSet("xyz", flag.ExitOnError)
		baz := set.Bool("baz", false, "")
		_ = set.Parse(os.Args[2:])
		fmt.Println(*baz)
	}
```

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

The Go [Stdlib][] already preserves sorted order of map keys:

> The map keys are sorted

[json]: https://pkg.go.dev/encoding/json

## HOWTO [HTTP][] `multipart/form-data` `POST` of file by local path <sup><sub>[*][multipart] [1102513506][] [1351755388][]</sub></sup>

[http]: https://pkg.go.dev/net/http
[multipart]: https://pkg.go.dev/mime/multipart
[1102513506]: https://github.com/curlconverter/curlconverter
[1351755388]: https://curlconverter.com/go

    curl -X POST "https://your.tld/your/path" -H "Content-Type: multipart/form-data" -F "file=@/etc/hostname;filename=your.file;type=*/*" --basic --user your_user:your_password

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

	fd, err := os.Open("/etc/hostname")
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
