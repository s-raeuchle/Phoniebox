#!/bin/bash

# PI Config
echo "Adjust config: Hifiberry, Shutdown GIPO Button"
cat ./pi/config.txt | ssh pi@pi.local "sudo tee -a /boot/config.txt"

echo "ALSA Hifiberry setup"
cat ./pi/asound.conf | ssh pi@pi.local "sudo tee -a /etc/asound.conf"	

ssh pi@pi.local "sudo reboot"

sleep 20

# Test Sound
ssh pi@pi.local "aplay -l"
ssh pi@pi.local "speaker-test -d hifiberry -c2 -twaf"

