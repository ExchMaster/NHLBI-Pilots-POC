#!/bin/bash

#Enable X11, deskotp env, etc
#yum install xorg-x11-xauth xorg-x11-fonts-* xorg-x11-font-utils xorg-x11-fonts-Type1 xorg-x11-apps gdm Xnest -y
#yum groupinstall 'Server with GUI' 'X Window System' -y

#Creates Raid 0 array on two disks, /dev/sdc & /dev/sdd
mdadm --create /dev/md127 --level 0 --raid-devices 50 /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw /dev/sdx /dev/sdy /dev/sdz /dev/sdaa /dev/sdab /dev/sdac /dev/sdad /dev/sdae /dev/sdaf /dev/sdag /dev/sdah /dev/sdai /dev/sdaj /dev/sdak /dev/sdal /dev/sdam /dev/sdan /dev/sdao /dev/sdap /dev/sdaq /dev/sdar /dev/sdas /dev/sdat /dev/sdau /dev/sdav /dev/sdaw /dev/sdax /dev/sday /dev/sdaz
#Formates partition using XFS
mkfs.xfs /dev/md127 -f
#Creates mount point and updates fstab so mount point persists during reboots, automatically mounts volumes for current session
mkdir -p /data
#add to fstabl
echo /dev/md127 /data                   xfs     defaults        0 0 >> /etc/fstab
#mount volumes
mount -a
#Allow everyone access to /data
chmod 777 /data