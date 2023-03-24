# [MIME][] type/[xdg][] default application rc

[mime]: https://freedesktop.org/wiki/Specifications/mime-apps-spec
[xdg]: https://freedesktop.org/wiki/Software/xdg-utils

## Query

    xdg-mime query default text/html

## Open

Open from console default application for file.
xdg-open desktop-independent and passes arguments to
gvfs-open, kde-open or exo-open respectively.

* <https://wiki.archlinux.org/index.php/Default_Applications>
* <https://wiki.archlinux.org/index.php/Xdg-open>

    xdg-open path/to/your/file

## Open with interactive menu/dialog

    zypper install perl-File-MimeInfo || apt-get install libfile-mimeinfo-perl
    mimeopen --ask-default path/to/your/file
