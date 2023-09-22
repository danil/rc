# [APT][] (Advanced Packaging Tool) of [Debian][]/[Ubuntu][] rc

[apt]: https://en.wikipedia.org/wiki/APT_(software)
[debian]: https://github.com/debian
[ubuntu]: https://github.com/ubuntu

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

## Add trusted key DEPRECATED

    apt-key add path/to/file.asc

## Add trusted key DEPRECATED

Fixing following signatures were invalid (https://github.com/yarnpkg/yarn/issues/7866)

    apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com

## TROUBLESHOOTING NO_PUBKEY

    curl https://your.tld/your/key.gpg | sudo gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/your-key.gpg --import
    echo -e "deb [signed-by=/usr/share/keyrings/your-key.gpg] https://your.tld.ru/your/ppa stable main" > /etc/apt/sources.list.d/your-list.list

## TROUBLESHOOTING NO_PUBKEY DEPRECATED

    curl https://your.tld/your/key.gpg | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/your-key.gpg --import
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
