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

# godef

Find function definition by package/function name
<https://godoc.org/github.com/rogpeppe/godef>

    godef -f path/to/file.go 'yourpackagename.YourFunctionName'

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

# pprof

Runtime profiling/benchmarking

* https://golang.org/pkg/runtime/pprof
* https://golang.org/pkg/net/http/pprof

# Sortable IDs

Sortable ID/UID or KSUID is for K-Sortable Unique IDentifier
<https://blog.kowalczyk.info/article/JyRZ/generating-good-random-and-unique-ids-in-go.html>.

* <https://github.com/rs/xid> `b50vl5e54p1000fo3gh0` 4 bytes of time (seconds) + 3 byte machine id + 2 byte process id + 3 bytes random
* <https://github.com/segmentio/ksuid> `0pPKHjWprnVxGH7dEsAoXX2YQvU` 4 bytes of time (seconds) + 16 random bytes

# Redirect pointer to value

Should use pointer to pointer to redirect all pointers to value into new value

* <https://stackoverflow.com/questions/8768344/what-are-pointers-to-pointers-good-for#8768916>
* <https://stackoverflow.com/questions/36531948/go-delete-an-object-by-its-pointer#36532226>

```go
package main

import "fmt"

func main() {
    m := make(map[string]**struct{ Foo int })

    fmt.Printf("%#v %t\n", m["x"], m["x"] == nil)
    fmt.Printf("%#v %t\n", m["y"], m["y"] == nil)

    s := &struct{ Foo int }{Foo: 123}

    m["x"] = &s
    m["y"] = &s

    fmt.Printf("%#v %t\n", *m["x"], *m["x"] == nil)
    fmt.Printf("%#v %t\n", *m["y"], *m["y"] == nil)

    s = &struct{ Foo int }{Foo: 321}

    fmt.Printf("%#v %t\n", *m["x"], *m["x"] == nil)
    fmt.Printf("%#v %t\n", *m["y"], *m["y"] == nil)

    s = nil

    fmt.Printf("%#v %t\n", *m["x"], *m["x"] == nil)
    fmt.Printf("%#v %t\n", *m["y"], *m["y"] == nil)
}
```

# MongoDB

MongoDB write/read (insert/find)

```go
package main

import (
    "fmt"

    mgo "gopkg.in/mgo.v2"
    "gopkg.in/mgo.v2/bson"
)

func main() {
    s, err := mgo.Dial("localhost:27017")
    if err != nil {
        panic(err)
    }

    defer s.Close()

    c := s.DB("your_db_name").C("your_collection_name")

    var i interface{}
    err = bson.UnmarshalJSON([]byte(`{"foo": "bar", "xyz": 123}`), &i)
    if err != nil {
        panic(err)
    }

    err = c.Insert(&i)
    if err != nil {
        panic(err)
    }

    var r []interface{}

    err = c.Find(nil).All(&r)
    if err != nil {
        panic(err)
    }

    fmt.Printf("%#v", r)
}
```

# Location by IP

Find location (country, geographic coordinate, latitude/longitude) by IP

<https://github.com/oschwald/geoip2-golang>

# Web frameworks

Web frameworks and routers

## Comparsion

<https://github.com/diyan/go-web-framework-comparsion>

## Benchmarks

<https://github.com/julienschmidt/go-http-routing-benchmark>
