# openSUSE Linux/Zypper RPM rc

## Version

    hostnamectl
    cat /etc/os-release
    cat /usr/lib/os-release

## Zypper package manager

https://en.opensuse.org/images/1/17/Zypper-cheat-sheet-1.pdf

    zypper --verbose

## Search package

    zypper search --details your-pkg || zypper se -s your-pkg

## Search regex package

    zypper se | grep your-pkg

## Search installed package

    zypper se --installed-only your-pkg || zypper se -i your-pkg

## Search package version

    zypper se --details your-pkg

## Search installed package

    zypper se rpm | grep "i+ | rpm"

## Package install

    zypper install --no-recommends your-pkg || zypper in 'your-pkg.i586<1.23'

## Reinstall all packages

    zypper in --no-recommends --download-in-advance -f $(rpm -qa --qf '%{NAME} ')

## Package uninstall

    zypper remove your-pkg

## Packages update

    zypper refresh || zypper ref

## Update/import signatures/keys

    zypper --gpg-auto-import-keys ref

## Package upgrade

    zypper update your-pkg || zypper up your-pkg

## Packages all upgrade

    zypper update || zypper up

## Package dependencies

    zypper info --requires your-pkg

## Package reverse dependencies

    zypper se --requires your-pkg

## Which package file belongs to

    zypper se --provides --match-exact path/to/your-file

## TODO: Configuration .rpmnew .rpmsave

## Package repositories list

    zypper repos || zypper lr --uri

## Enable repository

    zypper modifyrepo --enable 123

## Disable repository

    zypper mr --disable 321

## Distribution upgrade

    zypper dup --no-recommends

## Upgrade Leap to Tumbleweed

<https://techrepublic.com/article/how-to-upgrade-opensuse-leap-to-opensuse-tumbleweed>

    backup_date=$(date --utc +%Y%m%dT%H%M%SZ) && \
    mkdir /etc/zypp/repos.d/BAK$backup_date && \
    mv /etc/zypp/repos.d/*.repo /etc/zypp/repos.d/BAK$backup_date
    zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/oss repo-oss
    zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/non-oss repo-non-oss
    zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/debug repo-debug
    zypper ar -f -c http://download.opensuse.org/update/tumbleweed/ repo-update
    zypper dup

## Upgrade Leap 15.1 to 15.2

Update the system:

    zypper ref
    zypper up
    reboot

And then fix version number if hard-coded like described here
<https://cyberciti.biz/faq/how-to-upgrade-opensuse-15-1-to-15-2-using-the-cli>.

And then switch repositories like this:

    zypper --releasever=15.2 ref
    zypper --releasever=15.2 dup --no-recommends --download-in-advance --allow-vendor-change

And then `reboot`.

## TODO

    tumbleweed-cli
