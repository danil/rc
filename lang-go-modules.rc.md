# Go modules rc

go.mod, go.sum and friends

* https://blog.golang.org/using-go-modules
* https://github.com/golang/go/wiki/Modules

## Init

Init dependencies

    go mod init your.tld/hello

## Init (long)

```sh
cd path/to/module

cat > hello.go
package hello

func Hello() string {
    return "Hello, world."
}

cat > hello_test.go
package hello

import "testing"

func TestHello(t *testing.T) {
    want := "Hello, world."
    if got := Hello(); got != want {
        t.Errorf("Hello() = %q, want %q", got, want)
    }
}

go test
go mod init your.tld/hello
```

## List

List all modules including dependencies

    go list -m all

## Add

Adding dependency happens automatically

    go test

## Private module url

* <https://proxy.golang.org>

`GOPRIVATE=your.tld` или `GOPROXY="https://proxy.your.tld,direct"`

## Private/standard module url

Adding dependency from private git repository with non standard path,
for example `your.tld/your/non/standard/dir/your-user/your-mod-nm`

```sh
git config --global url."git@your.tld:your/non/standard/dir".insteadOf "https://your.tld/"
cd path/to/module
GOPRIVATE=your.tld go clean --modcache .
GOPRIVATE=your.tld go get -v -u your.tld/your-user/your-mod-nm
go test
```

## Update

Upgrading dependency

    go get -v -u your.tld/your-user/your-mod-nm@your-commit-hash-or-tag

## Update all

Upgrading all dependencies

    go get -u all
    go mod tidy

## Testsing

Test all packages sub directories

    find . -name '*_test.go' -exec sh -c 'echo "{}" && cd $(dirname "{}")  && go test' \;

## Why

Find out wrhere the dependence is used

    go mod why -m

## Remove unused

Removing/pruning unused dependencies

    go mod tidy -v

## Gitlab private sub group module get error

* https://gitlab.com/gitlab-org/gitlab-foss/-/issues/37832
* https://gitlab.com/gitlab-org/gitlab-foss/-/issues/65681
* <https://www.reddit.com/r/golang/comments/9n2phh/go_1111_module_issue_with_gitlab> nginx proxy workaround
