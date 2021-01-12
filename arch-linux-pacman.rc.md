# Arch Linux

## Packages list

    pacman --query --quiet

## Packages list explicitly installed

    pacman --query --explicit --quiet

## Package install

    pacman --verbose --sync your-pkg-name

## Packages list install

    pacman --sync --needed - < path/to/pkg/list

## Package remove

    pacman --remove --recursive your-pkg-name

## Remove packages unless list

<https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Install_packages_from_a_list>

    pacman --remove --recursive --unneeded $(comm -23 <(pacman --query --quiet | sort) <(sort path/to/pkg/list))

## Packages update

    pacman --sync --refresh

## Packages upgrade

    pacman --sync --sysupgrade

## Package search

<https://wiki.archlinux.org/index.php/Pacman#Querying_package_databases>

    pacman --sync --search your-pkg-name

## Package search installed

    pacman --query --search your-pkg-name

## Package search explicitly installed

Except `base` and `base-devel` packages
<https://bbs.archlinux.org/viewtopic.php?pid=690050#p690050>.

    pacman --query --quiet --explicit | grep your-pkg-name
    pacman --query --explicit --info \
      | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'

## Package search orphans

Useless packages, that are not associated with explicitly installed packages
<https://wiki.archlinux.org/index.php/System_maintenance#Check_for_orphans_and_dropped_packages>,
<https://bbs.archlinux.org/viewtopic.php?pid=690008#p690008>.

    pacman --query --deps --unrequired --quiet

## Cleaning the package cache

https://wiki.archlinux.org/index.php/Pacman#Cleaning_the_package_cache

    paccache --remove --keep 1
    paccache --remove --uninstalled --keep 0
    pacman --sync --clean

## Configs outdated search

<https://wiki.archlinux.org/index.php/Pacman/Pacnew_and_Pacsave#Locating_.pac*_files>

    locate --existing --regex "\.pac(new|save)$"
    find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
    grep --extended-regexp "\.pac(new|save)" /var/log/pacman.log

## Configs outdated diff/update by emacs

<https://github.com/UndeadKernel/pacfiles-mode>

## List files belongs to package

https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Listing_files_owned_by_a_package_with_size

    pacman --query --list --quiet mailutils \
           | grep --invert-match '/$' \
           | xargs --no-run-if-empty du --human-readable \
           | sort --human-numeric-sort

## AUR PKGBUILD

Arch User Repository <https://wiki.archlinux.org/index.php/Arch_User_Repository>.  
<https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages>

## AUR PKGBUILD compile and pack

    makepkg --syncdeps

## AUR PKGBUILD install

    pacman --upgrade your-1.2-3-any.pkg.tar.xz

## Compare pacman commands with apt/dnf/zypper/emerge

https://wiki.archlinux.org/index.php/Pacman/Rosetta

## Pacman-like wrapper for many package managers apt/dnf/zypper/emerge and so on

https://github.com/icy/pacapt

## Set hostname

<https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname>

    echo your-host-name > /etc/hostname
    hostnamectl set-hostname your-host-name

## Network interfaces list

    ip link

## Network IP address list

<https://wiki.archlinux.org/index.php/Network_configuration#IP_addresses>

    ip address show

## Add package to custom repository

https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Custom_local_repository

    curl --output your_prog.tar.gz  https://aur.archlinux.org/cgit/aur.git/snapshot/your_prog.tar.gz
    tar --extract --gzip --file your_prog.tar.gz
    cd your_prog
    makepkg
    mv your_prog.pkg.tar.zst /path/to/x86_64/
    repo-add /path/to/x86_64/your-name.db.tar.zst /path/to/x86_64/*.pkg.tar.zst

```bash
cat >> /etc/pacman.conf
[your-name]
SigLevel = Optional TrustAll
Server = http://arch.your-name.tld/x86_64
^D
```

```bash
cat >> /etc/nginx/nginx.conf
server {
    listen       80;
    server_name  arch.your-name.tld;
    root         /path/to/x86_64;
    autoindex    on;
}
^D
```

## Remove/delete package from custom repository

    repo-remove /path/to/x86_64/your-name.db.tar.zst your-1.2-3-any.pkg.tar.xz