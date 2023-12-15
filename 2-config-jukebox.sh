#!/bin/bash

# Audio files
scp ./phonie-settings/audio/flare.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/flare.wav
scp ./phonie-settings/audio/gate.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/gate.wav
scp ./phonie-settings/audio/wunderclock.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/wunderclock.wav
scp ./phonie-settings/audio/garrison.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/garrison.wav
scp ./phonie-settings/audio/convert2.wav  pi@pi.local:/home/pi/RPi-Jukebox-RFID/resources/audio/convert2.wav

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