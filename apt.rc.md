# APT (Advanced Packaging Tool)

## Repository

### Add

    add-apt-repository ppa:your-ppa-name/ppa
    apt-get update

### Remove

    add-apt-repository --remove ppa:your-ppa-name/ppa
    apt-get update

## Finding which package contains a file

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search /usr/bin/your_file_name

## Upgrade

Upgrades installed packages to their most recent version

    apt-get update
    apt-get --show-upgraded upgrade

## Download, modify, build and install packag

Get package source

```sh
apt-get source your-pkg-name
cd your-pkg-name
sudo apt-get build-dep your-pkg-name
```

## Other

    apt-get --show-upgraded dist-upgrade
    apt-cash [--full] search your-pkg-name
    apt-cash show your-pkg-name
    apt-cache depends your-pkg-name
    apt-get --target-release testing install your-pkg-name
    apt-get --purge remove your-pkg-name
    apt-get clean
    apt-cdrom [--cdrom /home/danil/mnt/cdrom] add
    apt-key add path/to/file.asc
    apt-mark unmarkauto
    reprepro
    wget --output-document=- http://backports.org/debian/archive.key \
      | apt-key add -
