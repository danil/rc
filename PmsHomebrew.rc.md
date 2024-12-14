# [Homebrew][] <sup><sub>[PMS][]</sub></sup> rc

[homebrew]: https://github.com/homebrew/brew
[pms]: https://en.wikipedia.org/wiki/Package_manager "Package Management System"

* HOWTO Install homebrew VER2 `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` <sup><sub>Install homebrew itself. [2745483436][]</sub></sup>
* HOWTO Install homebrew VER1 `test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"` and `test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"` and `test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile` and `echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile` <sup><sub>Install homebrew itself on [Linux]. [133724532][]</sub></sup>
* HOWTO Uninstall Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"` <sup><sub>Uninstall Homebrew itself. [1581471907][]</sub></sup>
* HOWTO List installed    `brew list`          <sup><sub>List installed packages.</sub></sup>
* HOWTO Check installed   `brew list your-pkg` <sup><sub>Check if package is installed.</sub></sup>
* HOWTO Search            `brew search your-pkg`
* HOWTO Search regexp     `brew search /^your-pkg$/`
* HOWTO Package version   `brew info --json your-pkg | jq -r '.[].versioned_formulae[]'`
* HOWTO Description       `brew desc --eval-all your-pkg`
* HOWTO Package files VER2 `brew ls your-pkg` <sup><sub>List package files excludes jpeg, png, gif, conf and so on.</sub></sup>
* HOWTO Package files VER1 `brew ls --verbose your-pkg` <sup><sub>List all files of package.</sub></sup>
* HOWTO Install           `brew install your-pkg`
* HOWTO Reinstall all     `brew list | xargs brew reinstall` <sup><sub>Reinstall all packages.</sub></sup>
* HOWTO List outdated     `brew outdated` <sup><sub>List outdated packages.</sub></sup>
* HOWTO Update package    `brew upgrade your-pkg`
* HOWTO Update all        `brew upgrade` <sup><sub>Update all packages.</sub></sup>
* HOWTO Package of file   `ls -l $(which your-file)` <sup><sub>Determine which package provides a given file.</sub></sup>
* HOWTO Repository add    `brew tap your-repo`
* HOWTO Repository remove `brew untap your-repo`
* HOWTO Services list     `brew services list`
* HOWTO Service start     `brew services run your-srv`
* HOWTO Service stop      `brew services kill your-srv`
* HOWTO Autorun enable    `brew services start your-srv` <sup><sub>Service autorun enable.</sub></sup>
* HOWTO Autorun disable   `brew services stop your-srv`  <sup><sub>Service autorun disable.</sub></sup>
* HOWTO Cleanup           `brew cleanup --prune=1 -s -n`
* TROUBLESHOOTING `brew doctor` and `brew config`

[linux]: https://github.com/torvalds/linux
[133724532]: https://docs.brew.sh/Homebrew-on-Linux#install
[2745483436]: https://brew.sh/#Install%20Homebrew
[1581471907]: https://github.com/homebrew/install?tab=readme-ov-file#uninstall-homebrew

## TROUBLESHOOTING Nginx service

<sup><sub>If fails to run brew service:</sub></sup>

```sh
$ brew services run nginx
$ grep "unexpected end of parameter" /home/linuxbrew/.linuxbrew/var/log/nginx/error.log | head -n 1
1970/01/01 00:00:00 [emerg] 100500#0: unexpected end of parameter, expecting ";" in command line
```

<sup><sup>Then run executable:</sub></sup>

    brew install libcap
    sudo setcap cap_net_bind_service=ep /home/linuxbrew/.linuxbrew/Cellar/nginx/0.1.23/bin/nginx
    /home/linuxbrew/.linuxbrew/Cellar/nginx/0.1.23/bin/nginx
