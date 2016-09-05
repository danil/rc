# Linux

## menuconfig

<https://en.wikipedia.org/wiki/Menuconfig>

    make menuconfig

## Compile

* <https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>
* <http://unix.stackexchange.com/questions/51815/why-people-recommend-the-j3-option-for-make-when-having-a-dual-core-cpu#51861>

    make --jobs=9

## Install

<https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>

    make install && grub-mkconfig --output=/boot/grub/grub.cfg
    make modules_install && emerge --verbose --oneshot --color=y @module-rebuild

## Get config

* <https://wiki.gentoo.org/wiki/Kernel/Upgrade#Copy_previous_kernel_configuration>
* <http://docs.slackware.com/slackbook:linux_kernel#compiling_a_kernel_and_why_to_do_so>

    zcat /proc/config.gz > /usr/src/linux/.config

## Source tree version

<http://stackoverflow.com/questions/12151694/how-to-find-the-version-of-a-linux-kernel-source-tree#12151750>

    make kernelversion

## Download

<https://www.kernel.org/pub/linux/kernel/>
