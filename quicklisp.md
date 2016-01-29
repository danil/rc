Quicklisp
=========

Search
------

    (ql:system-apropos "package-name")

### Installed

    (ql-dist:installed-releases (ql-dist:dist "quicklisp"))

### All available

    (ql:system-apropos "")

Remove
------

    (use-package :ql-dist) (uninstall (release "package-name"))

Install
-------

    (ql:quickload "package-name")
