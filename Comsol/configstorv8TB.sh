#!/bin/bash
#Update system
yum update -y
#Enable X11, deskotp env, etc
#yum install xorg-x11-xauth xorg-x11-fonts-* xorg-x11-font-utils xorg-x11-fonts-Type1 xorg-x11-apps gdm Xnest xterm -y
#yum groupinstall 'Server with GUI' 'X Window System' -y
#lsblk ‒‒noheadings ‒‒output UUID /dev/sdc1
#http://unix.stackexchange.com/questions/200582/scripteable-gpt-partitions-using-parted
#https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-linux-classic-attach-disk/
#Creates Raid 0 array on two disks, /dev/sdc & /dev/sdd
pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw /dev/sdx /dev/sdy /dev/sdz /dev/sdaa /dev/sdab /dev/sdac /dev/sdad /dev/sdae /dev/sdaf /dev/sdag /dev/sdah /dev/sdai /dev/sdaj /dev/sdak /dev/sdal /dev/sdam /dev/sdan /dev/sdao /dev/sdap /dev/sdaq /dev/sdar /dev/sdas /dev/sdat /dev/sdau /dev/sdav /dev/sdaw /dev/sdax /dev/sday /dev/sdaz
#Create volume group 
vgcreate vg1 /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw /dev/sdx /dev/sdy /dev/sdz /dev/sdaa /dev/sdab /dev/sdac /dev/sdad /dev/sdae /dev/sdaf /dev/sdag /dev/sdah /dev/sdai /dev/sdaj /dev/sdak /dev/sdal /dev/sdam /dev/sdan /dev/sdao /dev/sdap /dev/sdaq /dev/sdar /dev/sdas /dev/sdat /dev/sdau /dev/sdav /dev/sdaw /dev/sdax /dev/sday /dev/sdaz
#Create logical volume
lvcreate -l 100%VG -i 50 -n lv1 vg1
#Formates logical volume using XFS
mkfs.xfs /dev/vg1/lv1 -f
#Creates mount point and updates fstab so mount point persists during reboots, automatically mounts volumes for current session
mkdir -p /data
#Add to fstab
echo /dev/vg1/lv1 /data                   xfs     defaults        0 0 >> /etc/fstab
#mount volumes
mount -a
#Allow everyone access to /data
chmod 777 /data