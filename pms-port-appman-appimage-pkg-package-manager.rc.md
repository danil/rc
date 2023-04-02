# [AppMan][] [AppImage][] package manager rc

Based on [AM][] application manager.

[am]: https://github.com/ivan-hc/am-application-manager
[appimage]: https://github.com/appimage/appimagekit
[appman]: https://github.com/ivan-hc/appman

## Search

    appman -q your-pkg-nm | grep " your-pkg-nm "

## Show version information

    appman -a your-pkg-nm

## List installed

    appman -f

## Install

    appman -i your-pkg-nm

## Uninstall

    appman -r your-pkg-nm

## Update/upgrade

    appman -u your-pkg-nm

## Update all packages

    appman -u

## Update/upgrade/sync AppMan

    appman -s

## Cleanup unnecessary files and temporary folders

    appman -c
