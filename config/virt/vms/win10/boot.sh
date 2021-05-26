#!/bin/bash
## FROM https://github.com/joeknock90/Single-GPU-Passthrough
echo "---------------------------$(date)----------------------------------------------------------------"
if [ "$(grep 'vfio-pci.ids=8086:5917' /proc/cmdline)" != "" ]
then
echo "Booting VM"
#echo "b371b8b1-7be5-47ed-87bb-7d71127efeb6" > /sys/devices/pci0000\:00/0000\:00\:02.0/mdev_supported_types/i915-GVTg_V5_8/create
# Helpful to read output when debugging
set -x

BASE="/sys/kernel/iommu_groups"

# Stop display manager
systemctl stop display-manager.service
## Uncomment the following line if you use GDM
#killall gdm-x-session

sleep 10

#--------------------------------------gvt-d-------------------------------------------
# # Unbind VTconsoles
# echo 0 > /sys/class/vtconsole/vtcon0/bind
# echo 0 > /sys/class/vtconsole/vtcon1/bind

# # Unbind EFI-Framebuffer
# echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# # Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
# sleep 2

# # Unload all Nvidia drivers
# modprobe -r nvidia_drm
# modprobe -r nvidia_modeset
# modprobe -r nvidia_uvm
# modprobe -r nvidia
# modprobe -r i915

# # Unbind the GPU from display driver
# virsh nodedev-detach pci_0000_0c_00_0
# virsh nodedev-detach pci_0000_0c_00_1

# # Load VFIO Kernel Module  
# modprobe vfio-pci  

# # Prepare card 
# echo 0000:00:02.0 > /sys/bus/pci/devices/0000:00:02.0/driver/unbind
# echo 8086 5917 > /sys/bus/pci/drivers/vfio-pci/new_id
# echo 0000:01:00.0 > /sys/bus/pci/devices/0000:00:02.0/driver/unbind
# echo 10de 1d10 > /sys/bus/pci/drivers/vfio-pci/new_id
#--------------------------------------------------------------------------------------------
#---------------------------gvt-g--------------------------------------------------------------
# for GROUP in (1 10)
# do
# for i in $(ls /sys/kernel/iommu_groups/$GROUP/devices/); do
# 	if [ -e /sys/kernel/iommu_groups/$GROUP/devices/$i/driver ]; then
# 		if [ "$(basename $(readlink -f \
# 			/sys/kernel/iommu_groups/$GROUP/devices/$i/driver))" != \
# 			"pcieport" ]; then
# 			echo $i | sudo tee \
# 				/sys/kernel/iommu_groups/$GROUP/devices/$i/driver/unbind
# 		fi
# 	fi
# done

# for i in $(ls /sys/kernel/iommu_groups/$GROUP/devices/); do
# 	if [ ! -e /sys/kernel/iommu_groups/$GROUP/devices/$i/driver ]; then
# 		VEN=$(cat /sys/kernel/iommu_groups/$GROUP/devices/$i/vendor)
# 		DEV=$(cat /sys/kernel/iommu_groups/$GROUP/devices/$i/device)
# 		echo $VEN $DEV | sudo tee \
# 			/sys/bus/pci/drivers/vfio-pci/new_id
# 	fi
# done
# done

# touch /dev/shm/looking-glass
# chown john:kvm /dev/shm/looking-glass
# chmod 660 /dev/shm/looking-glass
#echo "b371b8b1-7be5-47ed-87bb-7d71127efeb6" > /sys/devices/pci0000\:00/0000\:00\:02.0/mdev_supported_types/i915-GVTg_V5_4/create || true

#--------------------------------------------------------------------------------------------

virsh -c qemu:///system start WinDev1911Eval-vfio

#111systemctl start getty@tty2.service

exit 0

# BASE="/sys/kernel/iommu_groups"
# GROUP=$1

# if [ "$GROUP" == "" ]
# then
# for i in $(find $BASE -maxdepth 1 -mindepth 1 -type d); do
# 	GROUP=$(basename $i)
# 	echo "### Group $GROUP ###"
# 	for j in $(find $i/devices -type l); do
# 		DEV=$(basename $j)
# 		echo -n "    "
# 		lspci -s $DEV
# 	done
# done
# exit 0
# fi

# if [ ! -e /sys/kernel/iommu_groups/$GROUP ]; then
# 	echo "IOMMU group $GROUP not found"
# 	exit 1
# fi

# if [ ! -e /sys/bus/pci/drivers/vfio-pci ]; then
# 	sudo modprobe vfio-pci
# fi

# for i in $(ls /sys/kernel/iommu_groups/$GROUP/devices/); do
# 	if [ -e /sys/kernel/iommu_groups/$GROUP/devices/$i/driver ]; then
# 		if [ "$(basename $(readlink -f \
# 			/sys/kernel/iommu_groups/$GROUP/devices/$i/driver))" != \
# 			"pcieport" ]; then
# 			echo $i | sudo tee \
# 				/sys/kernel/iommu_groups/$GROUP/devices/$i/driver/unbind
# 		fi
# 	fi
# done

# for i in $(ls /sys/kernel/iommu_groups/$GROUP/devices/); do
# 	if [ ! -e /sys/kernel/iommu_groups/$GROUP/devices/$i/driver ]; then
# 		VEN=$(cat /sys/kernel/iommu_groups/$GROUP/devices/$i/vendor)
# 		DEV=$(cat /sys/kernel/iommu_groups/$GROUP/devices/$i/device)
# 		echo $VEN $DEV | sudo tee \
# 			/sys/bus/pci/drivers/vfio-pci/new_id
# 	fi
# done

# exit 0
# modprobe vfio-pci

# for dev in "$@"; do
#         vendor=$(cat /sys/bus/pci/devices/$dev/vendor)
#         device=$(cat /sys/bus/pci/devices/$dev/device)
#         if [ -e /sys/bus/pci/devices/$dev/driver ]; then
#                 echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
#         fi
#         echo $vendor $device > /sys/bus/pci/drivers/vfio-pci/new_id
# done


# /etc/systemd/system/getty@tty1.service.d/override.conf

# [Service]
# ExecStart=
# ExecStart=-/usr/bin/agetty --autologin player --noclear %I $TERM


# /home/player/.profile
# startx "/usr/bin/lookinglass -F"
# startx "/usr/bin/virt-viewer -k -f WinDev1911Eval-vfio"
else
     echo "b371b8b1-7be5-47ed-87bb-7d71127efeb6" > /sys/devices/pci0000\:00/0000\:00\:02.0/mdev_supported_types/i915-GVTg_V5_4/create || true
    exit 0
fi 


