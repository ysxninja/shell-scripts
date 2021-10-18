#!/bin/sh
# script to mount disk and open directory from desktop


#check if mounted, continue to show directory, 
#else, || unmount and then remount  and continue to show directory.
#replace /dev/sda with your disk sda (check with `lsblk`)

udisksctl mount -b /dev/sda /media/$USER/ || udisksctl unmount /dev/sda && udisksctl mount -b /dev/sda /media/$USER/;

#edit with your file launcher ie.nautilus or nemo or pcmanfm or thunar...
nemo /path/to/file;

exit;
