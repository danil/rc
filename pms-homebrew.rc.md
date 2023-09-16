# [Homebrew][] rc

[homebrew]: https://github.com/homebrew/brew

## [Install homebrew][] itself on Linux

    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
    You’re done! Try installing a package:

[install homebrew]: https://docs.brew.sh/Homebrew-on-Linux#install

## Update homebrew itself and its metadata

    brew update --verbose

## List installed

    brew list

## Check if package is installed

    brew list your-pkg

## Search

    brew search your-pkg
    brew search /^your-pkg$/

## Package version

    brew info --json your-pkg | jq -r '.[].versioned_formulae[]'

## Description

    brew desc --eval-all your-pkg

## List package files excludes jpeg, png, gif, conf and so on

    brew ls your-pkg

## List all files of package

    brew ls --verbose your-pkg

## Install

    brew install your-pkg

## Uninstall

    brew uninstall your-pkg
    brew remove your-pkg

## Reinstall all packages

    brew list | xargs brew reinstall

## List outdated packages

    brew outdated

## Update package

    brew upgrade your-pkg

## Update all packages

    brew upgrade

## Determine which package provides a given file

    ls -l $(which your-file)

## Repository add

    brew tap your-repo

## Repository remove

    brew untap your-repo

## Services list

    brew services list

## Service start

    brew services run your-srv

## Service stop

    brew services kill your-srv

## Service autorun enable

    brew services start your-srv

## Service autorun disable

    brew services stop your-srv
