# APT (Advanced Packaging Tool) rc

## Repository add

    add-apt-repository ppa:your-ppa-nm/ppa
    apt-get update

## Repository remove

    add-apt-repository --remove ppa:your-ppa-nm/ppa
    apt-get update

## Finding which package contains a file

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search /usr/bin/your_file_nm

## Upgrade

Upgrades installed packages to their most recent version

    apt-get update
    apt-get --show-upgraded upgrade

## Download, modify, build and install packag

Get package source

```sh
apt-get source your-pkg
cd your-pkg
sudo apt-get build-dep your-pkg
sudo apt-get -f install
dch -i
debuild -us -uc -b
sudo dpkg -i ../your-pkg_1.2.3-1+19700101_amd64.deb
```

## Dependencies

    apt-cache depends your-pkg

## Depended

List of depended packages

    apt-cache rdepends --installed your_pkg_nm

## List all versions of the package

<https://askubuntu.com/questions/447/how-can-i-see-all-versions-of-a-package-that-are-available-in-the-archive#2108>

    apt-cache madison your-pkg

## Add trusted key

    apt-key add path/to/file.asc

## Add trusted key

Fixing following signatures were invalid (https://github.com/yarnpkg/yarn/issues/7866)

    apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com

## TROUBLESHOOTING: NO_PUBKEY

    wget https://your.tld/your/key.gpg -O- | sudo apt-key add - 

## Other

    apt-get --show-upgraded dist-upgrade
    apt-cash [--full] search your-pkg
    apt-cash show your-pkg
    apt-get --target-release testing install your-pkg
    apt-get --purge remove your-pkg
    apt-get clean
    apt-cdrom [--cdrom /home/danil/mnt/cdrom] add
    apt-mark unmarkauto
    reprepro
    wget --output-document=- http://backports.org/debian/archive.key \
      | apt-key add -
