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
<https://bbs.archlinux.org/viewtopic.php?pid=690008#p690008>.

    pacman --query --deps --unrequired --quiet

## Configs outdated search

<https://wiki.archlinux.org/index.php/Pacman/Pacnew_and_Pacsave#Locating_.pac*_files>

    locate --existing --regex "\.pac(new|save)$"
    find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
    grep --extended-regexp "\.pac(new|save)" /var/log/pacman.log

## Configs outdated diff/update by emacs

<https://github.com/UndeadKernel/pacfiles-mode>

## File belong to package

    pkgfile your-pkg-name

## AUR PKGBUILD

Arch User Repository <https://wiki.archlinux.org/index.php/Arch_User_Repository>.  
<https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages>

## AUR PKGBUILD compile and pack

    makepkg --syncdeps

## AUR PKGBUILD install

    pacman --upgrade your-pkg-name-1.2-3-any.pkg.tar.xz

## Set hostname

<https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname>

    echo your-host-name > /etc/hostname
    hostnamectl set-hostname your-host-name

## Network interfaces list

    ip link

## Network IP address list

<https://wiki.archlinux.org/index.php/Network_configuration#IP_addresses>

    ip address show
