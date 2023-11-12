Copy config instead of doing it every time ;)
https://askubuntu.com/questions/208378/how-do-i-copy-files-that-need-root-access-with-scp

Boot Config:
cat config.txt | ssh pi@pi.local "sudo tee -a /boot/config.txt"
Sound Config:
cat asound.conf | ssh pi@pi.local "sudo tee -a /etc/asound.conf"	
Reboot:
ssh pi@pi.local "sudo reboot"
--- sleep 20 sec ---

Install Phonie:
ssh pi@pi.local "cd; rm buster-install-*; wget https://raw.githubusercontent.com/MiczFlor/RPi-Jukebox-RFID/master/scripts/installscripts/buster-install-default.sh; chmod +x buster-install-default.sh; ./buster-install-default.sh"


Phonie Box Installation
See: https://splittscheid.de/phoniebox-bauanleitung-toniebox-alternative/


#########################################
#	Raspberry Pi OS			#
#########################################
Tool: Raspberry Pi Imager (Windows)

1. OS: "Raspberry Pi Lite 64"
2. Device: "USB-Stick | NVME | SD-Card"
3. Settings:
-> SSH 
-> Locale "de"
-> Wifi
4. Flush and Write


#########################################
#	Audio: HifiBerry MiniAmp	#
#########################################
Tool: SSH

[Enable MiniAMP]
Config: /boot/config.txt
- REMOVE: dtparam=audio=on
- EDIT: dtoverlay=vc4-kms-v3d -> dtoverlay=vc4-kms-v3d,noaudio
- ADD: dtoverlay=hifiberry-dac

Test: 'aplay -l'

[Setup ALSA]
Config: /etc/asound.conf
- CREATE: sudo nano /etc/asound.conf
-> ADD: 
pcm.hifiberry {
  type softvol
  slave.pcm "plughw:0"
  control.name "Master"
  control.card 0
}

pcm.!default {
 type plug
 slave.pcm "hifiberry"
}


REBOOT
PLAY Sound: speaker-test -d hifiberry -c2 -twaf


DEBUG:
ADD: dtdebug=1 -> /boot/config.txt
RUN: dmesg
LOOK AT: sudo vcdbg log msg

#########################################
#       OnOff Shim (NOT WORKING!)	#
#########################################

Command: 'curl https://get.pimoroni.com/onoffshim | bash'

#########################################
#       OnOff 				#
#########################################

(5) GPIO 3 + (5) GND (opposite) | see: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#gpio-and-the-40-pin-header
(8) GPIO 14 + (14) GND | Indicator LED

/boot/config.txt
-> ADD: 
```
dtoverlay=gpio-shutdown
```

#########################################
#	Phoniebox			#
#########################################

Download: https://github.com/MiczFlor/RPi-Jukebox-RFID/releases/tag/V2.4.0
Unzip and SCP: scp -r "E:\Downloads\RPi-Jukebox-RFID-2.4.0" "pi@192.168.178.27:/home/pi"
RENAME: mv RPi-Jukebox-RFID-2.4.0 phoniebox-2.4.0
Script premission: sudo chmod +x ~/phoniebox-2.4.0/scripts/installscripts/buster-install-default.sh
Install: ~/phoniebox-2.4.0/scripts/installscripts/buster-install-default.sh


BEFORE !!! ADD MOPIDY GPT KEY:
Add the archive’s GPG key:
```
sudo mkdir -p /etc/apt/keyrings
sudo wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg \
  https://apt.mopidy.com/mopidy.gpg
```

Add the APT repo to your package sources:
```
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
```

install
```
sudo apt update
sudo apt install mopidy


Script Command:
```
cd; rm buster-install-*; wget https://raw.githubusercontent.com/MiczFlor/RPi-Jukebox-RFID/master/scripts/installscripts/buster-install-default.sh; chmod +x buster-install-default.sh; ./buster-install-default.s


#########################################
#       Lautstärke Regler		#
#########################################
see: https://github.com/MiczFlor/RPi-Jukebox-RFID/wiki/Audio-RotaryKnobVolume
https://splittscheid.de/phoniebox-drehregler-simpel-installieren/

#########################################
#       Buttons				#
#########################################

https://github.com/MiczFlor/RPi-Jukebox-RFID/wiki/Hardware-Pinout-Overview

Previous: (38) GPIO 20
Play Pause: (40) GPIO 21
Next: (37) GPIO 26

#########################################
#       Tidal				#
#########################################

See: https://github.com/MiczFlor/RPi-Jukebox-RFID/wiki/Integrate-Service-TIDAL
 1. Install Mopidi:

Add the archive’s GPG key:
```
sudo mkdir -p /etc/apt/keyrings
sudo wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg \
  https://apt.mopidy.com/mopidy.gpg
```

Add the APT repo to your package sources:
```
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
```

install
```
sudo apt update
sudo apt install mopidy
```

start first time and create config file 
```
mopidy
```

register as service to start with pi
```
sudo systemctl enable mopidy
```

mopidy set audio to alsa, config (/home/pi/.config/mopidy/mopidy.conf) change
```
[audio]
output = alsasink
```

[MOPIDY TIDAL Plugin]

install plugin
```
sudo apt install pip
sudo pip3 install Mopidy-Tidal
```

install g-streamer
```
sudo apt-get install gstreamer1.0-plugins-bad
```

edit config(/home/pi/.config/mopidy/mopidy.conf)
```
[tidal]
enabled = true
quality = LOSSLESS
#client_id =
#client_secret =
#playlist_cache_refresh_secs = 0
#lazy = false
```

restart mopidy
```
sudo systemctl restart mopidy
```

[Tidal login]
- View Logs: 
```
journalctl -u mopidy | tail -10
...
Visit link.tidal.com/AAAAA to log in, the code will expire in 300 seconds.
```

- Visit Link and login!


h 

```


#########################################
# Static-IP				# 
#########################################
https://www.makeuseof.com/raspberry-pi-set-static-ip/