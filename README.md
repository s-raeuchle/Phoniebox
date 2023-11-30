# Phoniebox

This repo is my personal configuration of the [Phoniebox Project](https://phoniebox.de/)
The target of this repo is to do a reproducable installation of the box including all docs of my build.

Thanks a lot on the Open Source Team (a lot of dad's and weekend coders) of the Phoniebox! Another big thank you for the infos described in his [blog []](https://splittscheid.de/phoniebox-bauanleitung-toniebox-alternative/) building its own box is [splitti](https://github.com/splitti/)

## My Hardware:
- [Raspberry Pi 4 (8GB Ram)](https://geizhals.de/raspberry-pi-4-modell-b-v54547.html)
- [1TB SanDisc Extreme Portable SSD](https://geizhals.de/sandisk-extreme-1050mb-s-portable-ssd-1tb-sdssde61-1t00-g25-a2374502.html)
- [Hifiberry Miniamp](https://geizhals.de/hifiberry-miniamp-a2403639.html)
- 4 GPIO Buttons
- Neuftech RFID Card Reader
- 2 sound boxes

## Installation

1. Build a 32-bit! Raspberry Pi OS Lite using [Raspberry Pi Imager](https://www.raspberrypi.com/software/). **Set Wifi/Host Settings to make your life easyer**
2. Run the bash scripts in this repo one by one starting from 0
3. done!

## Music
This repo contains a downloader app. Fill the youtube.csv inside the folder and run the app.py do get the music you want to listen on the phoniebox downloaded and prepared in folders.

Some notes during my process: [here](./NOTES.md)