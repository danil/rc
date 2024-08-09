# Flatpak rc

## Install package manager

    apt install flatpak || yum install flatpak || zypper install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## List installed

    flatpak list

## Install

    flatpak install --verbose flathub your.pkg.Nm

## Remove/delete package

    flatpak uninstall your.pkg.Nm

## Search

    flatpak search your.pkg.Nm

## Update all packages

    flatpak update

## Run

    flatpak run your.pkg.Nm "$@"

## List remotes

    flatpak remotes

## TROUBLESHOOTING setting up custom mouse cursor theme

    flatpak --user override --filesystem=/home/$USER/.icons/:ro # Custom mouse cursor theme files reside in the home `~/.icons` directory and whouse Flatpak configuration override reside in `~/.local/share/flatpak/overrides/global` file.
