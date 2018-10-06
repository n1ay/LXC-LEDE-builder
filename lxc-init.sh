#!/bin/bash

lxc_name='LEDE-builder'
lxc_dist='ubuntu:16.04'

#no lxc with such name, just create a new one
if [ $(lxc list | grep $lxc_name | wc -l) -eq 0 ]
then
    lxc launch $lxc_dist $lxc_name
else
    echo "Container $lxc_name exists. Delete it and create a new one? [y/n]"
    while [ "$(echo $del | tr 'A-Z' 'a-z')" != "y" ] && [ "$(echo $del | tr 'A-Z' 'a-z')" != "n" ]
    do
        read del
        case $del in
        y|Y)
            lxc delete --force $lxc_name
            lxc launch $lxc_dist $lxc_name
            while [ $(lxc list | grep $lxc_name | wc -l) -eq 0 ]
            do
                sleep 1
            done
            sleep 5
            echo "Container up. Pushing files into it."
            lxc file push packages.txt $lxc_name/root/
            lxc file push .config $lxc_name/root/
            lxc file push lxc-install.sh $lxc_name/root/
            lxc file push lxc-build.sh $lxc_name/root/
            echo "Success"
        ;;
        n|N)
            echo "Aborting."
        ;;
        *)
            echo "Please select [y/n]"
        esac
    done
fi
