# Quicklisp

## Search

    (ql:system-apropos "pkg-nm")

### Installed

    (ql-dist:installed-releases (ql-dist:dist "quicklisp"))

### All available

    (ql:system-apropos "")

## Remove

    (use-package :ql-dist) (uninstall (release "pkg-nm"))

## Install

    (ql:quickload "pkg-nm")
