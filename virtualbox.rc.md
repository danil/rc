# VirtualBox

Host IP 10.0.2.2

    sudo bash -c "export VBOX_USER_HOME=/home/you/.VirtualBox && VirtualBox"

# vms

Virtual machines

## List

    VBoxManage list vms

## Delete

<http://unix.stackexchange.com/questions/28611/how-to-automatically-start-and-shut-down-virtualbox-machines#answer-29384>

    VBoxManage controlvm your-virtual-machine-nm poweroff
    VBoxManage unregistervm your-virtual-machine-nm --delete

## Clone

Clone a virtual machine

    VBoxManage clonehd image.vdi --format VDI ~/source-image.vdi
