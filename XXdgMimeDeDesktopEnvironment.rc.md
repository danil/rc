# [MIME][] type/[xdg][] default application [*][xdg wiki] rc

[mime]: https://freedesktop.org/wiki/Specifications/mime-apps-spec
[xdg wiki]: https://wiki.archlinux.org/title/XDG_MIME_Applications
[xdg]: https://freedesktop.org/wiki/Software/xdg-utils

## Query default application of MIME type

    xdg-mime query default text/html

## Query MIME type of file

    file --mime-type -b path/to/file

## Open <sup><sub>[4289472207][]</sub></sup>

https://techbase.kde.org/Development/Tools/Using_kfmclient

Open from console default application for file.
xdg-open desktop-independent and passes arguments to
gvfs-open, kde-open or exo-open respectively.

* <https://wiki.archlinux.org/title/Default_Applications>
* <https://wiki.archlinux.org/title/Xdg-open>

    xdg-open path/to/your/file

[4289472207]: https://wiki.archlinux.org/title/Default_applications#Resource_openers

## Open with interactive menu/dialog

    apt-get install libfile-mimeinfo-perl || zypper install perl-File-MimeInfo
    mimeopen --ask-default path/to/your/file

## Update database of desktop entries [*][xdg wiki] [*][update desktop file]

    update-desktop-database -v ~/.local/share/applications

[update desktop file]: https://wiki.archlinux.org/title/desktop_entries#Update_database_of_desktop_entries
