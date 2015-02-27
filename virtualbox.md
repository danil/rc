<!-- -*- coding: utf-8; -*- -->

VirtualBox
==========

Host IP 10.0.2.2

vms
===

Virtual machines

List
----

    vboxmanage list vms

Delete
------

    vboxmanage unregistervm my-virtual-machine-name --delete

Clone
-----

Clone a virtual machine

    vboxmanage clonehd image.vdi --format VDI ~/source-image.vdi
