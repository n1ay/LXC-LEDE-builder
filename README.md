# LXC-LEDE-builder

## Description
Linux container based on a ubuntu 16.04 for building LEDE.  
It contains predefined .config for Raspberry Pi 3 B/B+  

## Installation guide
Installation is quite simple. Make sure to have lxd installed on your PC, and your user is in the lxd group.  
Then:  
```
./lxc-init.sh
```
Check if new container was successfuly created with
```
lxc list
```
You should see `LEDE-builder` with status `RUNNING` on the list.  
Go into the container:
```
lxc shell LEDE-builder
```
And run:
```
./lxc-install.sh
```
This will took some time, so feel free to make a coffee break.  
Now everything is set up.
Go into lede directory and sync .config. Feel free to make any changes to the config. If you didn't make any changes stil choose to save changes option. This will sync files with configuration.
```
make menuconfig
```

## Building

You don't have to run all these commands every time you build. After installation guide just run:
```
./lxc-build.sh
```

