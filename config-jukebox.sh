#!/bin/bash

# Stop Jukebox
ssh pi@pi.local "systemctl --user stop jukebox-daemon"

# Jukebox Config
cat ./phonie-settings/jukebox.yaml | ssh pi@pi.local "sudo tee /home/pi/RPi-Jukebox-RFID/shared/settings/jukebox.yaml"

# Jukebox GPIO Config
cat ./phonie-settings/gpio.yml | ssh pi@pi.local "sudo tee /home/pi/RPi-Jukebox-RFID/shared/settings/gpio.yml"

# Start Jukebox in console and check the log output (optional)
# $ ./src/jukebox/run_jukebox.py
# and if OK, press Ctrl-C and restart the service

# Restart the service
ssh pi@pi.local "systemctl --user start jukebox-daemon"