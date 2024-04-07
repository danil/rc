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

    dpkg-query --listfiles <package_name>

## Find package a file belongs to <sup>[*][superuser 11003]</sup>

    dpkg --search path/to/file
    apt-file search path/to/file

[superuser 11003]: <https://superuser.com/questions/10997/find-what-package-a-file-belongs-to-in-ubuntu-debian#11003>
