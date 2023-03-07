# flatpak rc

## Install package manager

    apt install flatpak || yum install flatpak || zypper install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## List installed

    flatpak list

## Install

    flatpak install --verbose flathub your.package.Name

## Run

    flatpak run your.package.Name "$@"

## Remove/delete package

    flatpak uninstall your.package.Name

## Search

    flatpak search your.package.Name

## Update all packages

    flatpak update

## List remotes

    flatpak remotes
