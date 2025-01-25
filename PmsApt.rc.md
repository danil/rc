# [Advanced Packaging Tool][APT] <sup><sub>[Debian][]/[Ubuntu][]</sub></sup> rc

[apt]: https://en.wikipedia.org/wiki/APT_(software) "Advanced Packaging Tool"
[debian]: https://github.com/debian
[ubuntu]: https://github.com/ubuntu

* HOWTO Update all      `apt update && apt list --upgradable && apt --show-upgraded upgrade` <sup><sub>Update all packages. Upgrades installed packages to their most recent version.</sub></sup>
* HOWTO Remove unused   `apt autoremove`  <sup><sub>Packages were automatically installed and are no longer required.</sub></sup>
* HOWTO File belongs to VER2 `dpkg -S path/to/your/file || dpkg --search path/to/your/file` <sup><sub>File belongs to package. Find out what package contains a file.</sub></sup>
* HOWTO File belongs to VER1 `apt-file update && apt-file search path/to/your/file`         <sup><sub>[2371447947][] [4187406413][]</sub></sup>
* HOWTO Add [PPA][]     `add-apt-repository          ppa:your-ppa-nm/ppa && apt-get update`  <sup><sub>[PPA][] [3939807489][]</sub></sup>
* HOWTO Del [PPA][]     `add-apt-repository --remove ppa:your-ppa-nm/ppa && apt-get update`  <sup><sub>Delete repository.</sub></sup>
* HOWTO [PPA][] Key dir VER2 `/etc/apt/trusted.gpg.d` <sup><sub>Trusted implicitly by [APT][]. Signature key location directory path. [508573924][]</sub></sup>
* HOWTO [PPA][] Key dir VER1 `/usr/share/keyrings`    <sup><sub>Is not specific to [APT][], but [APT][] can use the keyrings stored there, but if are referenced explicitly, via `[signed-by=]`.</sub></sup>
* DEPRECATED HOWTO [PPA][] Key dir `/etc/apt/trusted.gpg` <sup><sub>[1580539965][]</sub></sup>

[ppa]: https://help.launchpad.net/Packaging/PPA "Personal Package Archive"
[1580539965]: https://askubuntu.com/questions/1436343/move-keys-from-legacy-trusted-gpg-to-usr-share-keyrings-for-ubuntu-sources-as-we#1436346
[2371447947]: https://cyberciti.biz/faq/equivalent-of-rpm-qf-command
[3939807489]: https://launchpad.net/ubuntu/+ppas
[4187406413]: http://debian-administration.org/articles/334
[508573924]: https://reddit.com/r/linux4noobs/comments/1bvpwhe/comment/ky3a235

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

## HOWTO `apt upgrade` or `apt full-upgrade`

The difference between upgrade and full-upgrade
is that full-upgrade removes packages if necessary.

<sup><sub>So if keeping up-to-date in all cases
is more important than features, apt full-upgrade is better than apt upgrade.
In practice, automatically removing packages could result in an unusable system.
[2810974564][]</sub></sup>

[2810974564]: https://unix.stackexchange.com/questions/756169/apt-upgrade-or-apt-full-upgrade#756170

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
