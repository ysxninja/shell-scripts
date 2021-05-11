#!/bin/bash
# script to mount disk and open directory from desktop


#check if mounted, continue to show directory, 
#else, || unmount and then remount  and continue to show directory.
#replace /dev/`sda6` with your disk sda (check with `lsblk`)
udisksctl mount -b /dev/sda6 /media/yasuke/ || udisksctl unmount /dev/sda6 && udisksctl mount -b /dev/sda6 /media/yasuke/;

#edit with your file launcher ie.nautilus or nemo or pcmanfm or thunar...
nemo /media/yasuke/Linux/LEARN;

exit;
