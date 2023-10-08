# [MIME][] type/[xdg][] default application [*][xdg wiki] rc

[mime]: https://freedesktop.org/wiki/Specifications/mime-apps-spec
[xdg wiki]: https://wiki.archlinux.org/title/XDG_MIME_Applications
[xdg]: https://freedesktop.org/wiki/Software/xdg-utils

## Query default application of MIME type

    xdg-mime query default text/html

## Query MIME type of file

    file --mime-type -b path/to/file

## Open

Open from console default application for file.
xdg-open desktop-independent and passes arguments to
gvfs-open, kde-open or exo-open respectively.

* <https://wiki.archlinux.org/index.php/Default_Applications>
* <https://wiki.archlinux.org/index.php/Xdg-open>

    xdg-open path/to/your/file

## Open with interactive menu/dialog

    apt-get install libfile-mimeinfo-perl || zypper install perl-File-MimeInfo
    mimeopen --ask-default path/to/your/file

## Update database of desktop entries [*][xdg wiki] [*][update desktop file]

    update-desktop-database -v ~/.local/share/applications

[update desktop file]: https://wiki.archlinux.org/title/desktop_entries#Update_database_of_desktop_entries
