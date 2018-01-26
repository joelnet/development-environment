# Configuration for odroid-c1

## Ubuntu 16.0.4

Install from: https://odroid.in/ubuntu_16.04lts/

```bash
wget https://odroid.in/ubuntu_16.04lts/ubuntu-16.04.3-minimal-odroid-c1-20170914.img.md5sum
wget https://odroid.in/ubuntu_16.04lts/ubuntu-16.04.3-minimal-odroid-c1-20170914.img.xz
7z e ubuntu-16.04.3-minimal-odroid-c1-20170914.img.xz
md5sum -c ubuntu-16.04.3-minimal-odroid-c1-20170914.img.md5sum
```

Install to usb stick using Startup Disk Creator.

### Change the boot partition to FAT32

Small FAT16 partitions have problems storing a large number of files. A 128MB FAT16 partition will have problems storing over 164 files.

Note: You may have to boot the device at least once before running these steps.

```bash
# backup files on boot
find /media/joel/boot -type f -printf "%f\n" | xargs tar cf boot.tar -C /media/joel/boot

# unmount
sudo umount /media/joel/boot

# format FAT32
sudo mkfs.fat -F32 -v -I -n "boot" /dev/sdc1

# mount
sudo mkdir /media/joel/boot
sudo mount /dev/sdc1 /media/joel/boot

# copy files back to boot
sudo tar -xvf boot.tar -C /media/joel/boot
```

### Create new sudo user

```bash
# add user
adduser <user>

# add to sudo group
usermod -aG sudo <user>
```

Copy your ssh-key to the remote server. This assumes you already have an ssh-key generated.

```bash
ssh-copy-id <user>@odroid
```

## Secure root account

Change the root password

```bash
passwd
```

Edit `/etc/ssh/sshd_config` and set the following 

```
PermitRootLogin no
```

note: Ensure that you are logged into the box with another shell before restarting sshd to avoid locking yourself out of the server. 

```bash
/etc/init.d/ssh restart
```

### Prepare your build environment

These tools are required to build the kernel.

```bash
sudo apt-get -y install bc curl gcc git libncurses5-dev lzop make u-boot-tools
```

## Docker

### Install Docker

```bash
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
```