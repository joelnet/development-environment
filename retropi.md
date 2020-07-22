# My setup for RetroPie on my Raspberry PI 4

## Image

https://retropie.org.uk/download/

## Initial Setup

- Enable SSH
- Disable overscan
- Setup WIFI

## Upgrade

```bash
sudo apt-get update
sudo apt-get upgrade
sudo reboot
```

## Alias ll

```bash
printf "\nalias ll='ls -alh'\n" >> ~/.bashrc
source ~/.bashrc
```

## Install Dependencies

```bash
sudo apt install wget bc
```

## install wifi drivers for ASUS AC53-nano USB

Confirmed working for kernel `4.19.97-v7l+`

```bash
git clone https://github.com/EntropicEffect/rtl8822bu.git
cd rtl8822bu
make
sudo make install
```

Confirmed working for kernel `5.4.51-v7l+`

```bash
git clone https://github.com/cilynx/rtl88x2bu.git
cd rtl88x2bu
VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
sudo dkms add -m rtl88x2bu -v ${VER}
sudo dkms build -m rtl88x2bu -v ${VER}
sudo dkms install -m rtl88x2bu -v ${VER}
sudo modprobe 88x2bu
sudo reboot
```

# Disable onboard WIFI

```bash
sudo nano /boot/config.txt
# add "adtoverlay=disable-wifi" to file
sudo reboot
```

## Speed Test

```bash
wget https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-armhf-linux.tgz
tar xvf download_file?file_path=ookla-speedtest-1.0.0-armhf-linux.tgz
./speedtest
```

## Install Steam Link

RetroPie Connfig -> RETROPIE SETUP -> Manage Packages -> Manage Experimental Packages -> steamlink -> Install from pre-compiled binary
