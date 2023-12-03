#!/bin/bash

# Deinstall 
# - MTA (Message Transfer Agend) (No Mail functions needed)
ssh pi@pi.local "sudo update-rc.d exim4 remove -y"

# Disable Services
ssh pi@pi.local "sudo systemctl disable keyboard-setup.service \
    && sudo systemctl disable nmbd.service \
    && sudo systemctl disable NetworkManager-wait-online.service \
    && sudo systemctl disable triggerhappy.service \
    && sudo systemctl disable dphys-swapfile.service \
    && sudo systemctl disable hciuart.service \
    && sudo systemctl mask rc-local \
    && sudo systemctl disable raspi-config.service \
    && sudo systemctl disable avahi-daemon.service \
    && sudo systemctl disable sys-kernel-debug.mount \
    && sudo systemctl disable ModemManager.service \
    && sudo systemctl disable systemd-udev-trigger.service \
    && sudo systemctl disable rpi-eeprom-update.service \
    && sudo systemctl disable systemd-journald.service \
    && sudo systemctl disable systemd-fsck-root.service \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-rc-local-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-cryptsetup-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-debug-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-hibernate-resume-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-run-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-system-update-generator \
    && sudo chmod a-x /lib/systemd/system-generators/systemd-veritysetup-generator"

ssh pi@pi.local "sudo apt-get update \
    && sudo apt-get -y install dropbear \
    && sudo sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear \
    && sudo systemctl enable dropbear && sudo service ssh stop && sudo service dropbear start && sudo apt-get -y remove openssh-server && sudo apt -y autoremove && sudo reboot"