# Sanp package manager rc

https://snapcraft.io/docs/distro-support
https://wiki.archlinux.org/title/Snap
https://en.wikipedia.org/wiki/Snap_(software)

## List installed

    snap list

## Search regex

    snap search your-pkg | grep ^your-pkg[^a-z0-9-]

## Install

    snap install your-pkg

## Uninstall

    snap remove your-pkg

## List outdated

    snap refresh --list

## Update/upgrade

    snap refresh your-pkg

## Update/upgrade all packages

    snap refresh
