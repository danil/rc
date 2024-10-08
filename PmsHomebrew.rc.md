# [Homebrew][] rc

[homebrew]: https://github.com/homebrew/brew

## HOWTO [VER1 Install homebrew][] itself

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

[ver1 install homebrew]: https://brew.sh/#Install%20Homebrew

## HOWTO [VER2 Install homebrew][] itself on Linux

    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
    You’re done! Try installing a package:

[ver2 install homebrew]: https://docs.brew.sh/Homebrew-on-Linux#install

## HOWTO [Uninstall Homebrew][] itself

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

[uninstall homebrew]: https://github.com/homebrew/install?tab=readme-ov-file#uninstall-homebrew

## HOWTO List installed

    brew list

## HOWTO Check if package is installed

    brew list your-pkg

## HOWTO Search

    brew search your-pkg
    brew search /^your-pkg$/

## HOWTO Package version

    brew info --json your-pkg | jq -r '.[].versioned_formulae[]'

## HOWTO Description

    brew desc --eval-all your-pkg

## HOWTO List package files excludes jpeg, png, gif, conf and so on

    brew ls your-pkg

## HOWTO List all files of package

    brew ls --verbose your-pkg

## HOWTO Install

    brew install your-pkg

## HOWTO Uninstall

    brew uninstall your-pkg
    brew remove your-pkg

## HOWTO Reinstall all packages

    brew list | xargs brew reinstall

## HOWTO List outdated packages

    brew outdated

## HOWTO Update package

    brew upgrade your-pkg

## HOWTO Update all packages

    brew upgrade

## HOWTO Determine which package provides a given file

    ls -l $(which your-file)

## HOWTO Repository add

    brew tap your-repo

## HOWTO Repository remove

    brew untap your-repo

## HOWTO Services list

    brew services list

## HOWTO Service start

    brew services run your-srv

## HOWTO Service stop

    brew services kill your-srv

## HOWTO Service autorun enable

    brew services start your-srv

## HOWTO Service autorun disable

    brew services stop your-srv

## HOWTO Cleanup

    brew cleanup --prune=1 -s -n

## TROUBLESHOOTING

    brew doctor
    brew config

## TROUBLESHOOTING nginx service

If fails to brew services run:

```sh
$ brew services run nginx
$ grep "unexpected end of parameter" /home/linuxbrew/.linuxbrew/var/log/nginx/error.log | head -n 1
1970/01/01 00:00:00 [emerg] 100500#0: unexpected end of parameter, expecting ";" in command line
```

Then run executable:

    brew install libcap
    sudo setcap cap_net_bind_service=ep /home/linuxbrew/.linuxbrew/Cellar/nginx/0.1.23/bin/nginx
    /home/linuxbrew/.linuxbrew/Cellar/nginx/0.1.23/bin/nginx
