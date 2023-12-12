#!/bin/bash

# Audio files
scp ./flare.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/flare.wav
scp ./gate.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/gate.wav
scp ./wunderclock.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/wunderclock.wav
scp ./garrison.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/garrison.wav
scp ./convert2.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/convert2.wav

# Stop Jukebox
ssh pi@pi.local "systemctl --user stop jukebox-daemon"

# Jukebox Config
cat ./phonie-settings/jukebox.yaml | ssh pi@pi.local "sudo tee /home/pi/RPi-Jukebox-RFID/shared/settings/jukebox.yaml"

# Jukebox GPIO Config
cat ./phonie-settings/gpio.yaml | ssh pi@pi.local "sudo tee /home/pi/RPi-Jukebox-RFID/shared/settings/gpio.yaml"

# Restart the service
ssh pi@pi.local "systemctl --user start jukebox-daemon"

# MPD Adjustments
cat ./pi/mpd.conf | ssh pi@pi.local "sudo tee /home/pi/.config/mpd/mod.conf"