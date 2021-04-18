#uname commands

uname #giving output Linux
uname -s #giving kernal name

uname -r #kernal release

uname -v #kernal version

uname -n #network hostname

uname --nodename #


uname --m #hardware arcihitecture i.e i386 x86_64 etc

uname -p #processor info

uname -i #hardware info i.e processor info
uname -o #operating system

uname -a #all information

##########################Detailed hardware info
#sudo lshw

lshw -short #short summery
#sudo lshw -html > my_system_info.html #hardware profile details html file create

lscpu #get cpu info

lsblk #get block device information

lsblk -a #all device block info

lsusb #get info about usb devices

lsusb -v #details about usb devices


