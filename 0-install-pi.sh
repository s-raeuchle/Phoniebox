#!/bin/bash

# PI Config
echo "Adjust config: Hifiberry, Shutdown GIPO Button"
cat ./pi/config.txt | ssh pi@pi.local "sudo tee /boot/config.txt"

echo "ALSA Hifiberry setup"
cat ./pi/asound.conf | ssh pi@pi.local "sudo tee /etc/asound.conf"	

echo "OnOf Shim setup"
ssh pi@pi.local "curl https://get.pimoroni.com/onoffshim | bash"
cat ./pi/cleanshutd.conf | ssh pi@pi.local "sudo tee /etc/cleanshutd.conf"	

ssh pi@pi.local "sudo reboot"