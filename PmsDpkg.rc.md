# dpkg rc

Debian package

    dpkg --list emacs*
    dpkg --listfiles emacs21-nox
    dpkg --search stdio.h
    dpkg-architecture
    dpkg --extract xlibs_4.3.0.dfsg.1-14sarge7_all.deb ./
    dpkg-scanpackages

## Package version

    dpkg --status emacs21-nox

## Install

<http://cyberciti.biz/faq/ubuntu-linux-how-do-i-install-deb-packages>

    dpkg --install your_pkg_nm.deb

## Remove

    dpkg --remove your_pkg_nm.deb

## Files belongs to package

<http://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package#32509>

    dpkg-query --listfiles <pkg_nm>

## HOWTO

* HOWTO File belongs to `dpkg -S path/to/your/file || dpkg --search path/to/your/file` <sup><sub>File belongs to package. Find out what package contains a file.</sub></sup>
