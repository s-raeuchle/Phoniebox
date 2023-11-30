#!/bin/bash

# Install - future3/develop
# cd; GIT_USER='MiczFlor' GIT_BRANCH='future3/develop' bash <(wget -qO- https://raw.githubusercontent.com/MiczFlor/RPi-Jukebox-RFID/future3/develop/installation/install-jukebox.sh)
# cd; bash <(wget -qO- https://raw.githubusercontent.com/MiczFlor/RPi-Jukebox-RFID/future3/develop/installation/install-jukebox.sh)

# Build Web App (Node + npm)
# cd ~/RPi-Jukebox-RFID/src/webapp && ./run_rebuild.sh -u

# Install - future3/main
ssh pi@pi.local "cd; bash <(wget -qO- https://raw.githubusercontent.com/MiczFlor/RPi-Jukebox-RFID/future3/develop/installation/install-jukebox.sh)"

# Stop Jukebox
ssh pi@pi.local "systemctl --user stop jukebox-daemon"