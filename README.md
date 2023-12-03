# Phoniebox

This repo is my personal configuration of the [Phoniebox Project](https://phoniebox.de/)
The target of this repo is to do a reproducable installation of the box including all docs of my build.

Thanks a lot on the Open Source Team (a lot of dad's and weekend coders) of the Phoniebox! Another big thank you for the infos described in his [blog](https://splittscheid.de/phoniebox-bauanleitung-toniebox-alternative/) building its own box is [splitti](https://github.com/splitti/)

## My Hardware:
- [Raspberry Pi 4 (8GB Ram)](https://geizhals.de/raspberry-pi-4-modell-b-v54547.html)
- [1TB SanDisc Extreme Portable SSD](https://geizhals.de/sandisk-extreme-1050mb-s-portable-ssd-1tb-sdssde61-1t00-g25-a2374502.html)
- [Hifiberry Miniamp](https://geizhals.de/hifiberry-miniamp-a2403639.html)
- [3 Buttons 22mm](https://geizhals.de/3422565781)
- [1 Push Button 12mm](https://www.amazon.de/gp/product/B0C135W52J/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
- [Neuftech USB RFID Card Reader](https://geizhals.de/rfid-nfc-modul-em4100-verschiedene-hersteller-a1520356.html)
- [2 Boxes](https://geizhals.de/visaton-frs-8-8-ohm-2004-a2855789.html)
- [GPIO Extension Board](https://geizhals.de/1940125090)
- [Extertnal Charging cabel](https://geizhals.de/2223961498)
- [PowerBank](https://geizhals.de/3502046731)

## My Software
- Raspberry Pi OS Lite (32-bit) | Bookworm
- Phoniebox future3 v3.3
- Configs and OS Tunings are inside this repo!

## Installation
1. Build a 32-bit! Raspberry Pi OS Lite using [Raspberry Pi Imager](https://www.raspberrypi.com/software/). **Set Wifi/Host Settings to make your life easyer**
2. Run the bash scripts in this repo one by one starting from 0
3. done!

## Music
This repo contains a [downloader app](./downloader). Fill the [youtube.csv](./downloader/youtube.csv) run the appplication to get the music you want to listen on the phoniebox, downloaded and prepared in folders.

Some notes during my process: [here](./NOTES.md)

## RPI Boot Optimization

After a clean installation of Raspberry OS and the Phoniebox I had a boot time of **43 Seconds**. I spend some time on reading and optimizing...here is what I did:

- [x] [/boot/config.txt](./pi/config.txt)
- [x] [/boot/cmdline.txt](./pi/cmdline.txt)
- [x] services ([pulseaudio](./systemd/pulseaudio.service), [mpd](./systemd/mpd.service), [jukebox-daemon](./systemd/jukebox-daemon.service))
- [x] disabled auto hotspot
- [x] set static ip
- [x] disable boot partition (`sudo nano /etc/fstab`)
- [x] raspberrypi Firmwareupdate (run: `sudo rpi-update`)
- [x] disabled a lot of services ([3-optimize-boot.sh](./3-optimize-boot.sh))


Finally I reached **13 Seconds** which is for now super!


```bash
# List of Services boot on start-up
pi@pi:~ $ systemd-analyze blame
2.879s dev-sda2.device
2.236s e2scrub_reap.service
1.609s smbd.service
1.102s samba-ad-dc.service
 938ms NetworkManager.service
 754ms systemd-logind.service
 653ms dnsmasq.service
 591ms systemd-binfmt.service
 552ms user@1000.service
 516ms systemd-timesyncd.service
 416ms systemd-journal-flush.service
 381ms networking.service
 306ms systemd-udevd.service
 282ms dev-mqueue.mount
 280ms sys-kernel-debug.mount
 277ms sys-kernel-tracing.mount
 246ms systemd-udev-trigger.service
 226ms modprobe@dm_mod.service
 220ms modprobe@configfs.service
 219ms fake-hwclock.service
 216ms modprobe@drm.service
 216ms kmod-static-nodes.service
 214ms avahi-daemon.service
 205ms modprobe@efi_pstore.service
 195ms modprobe@fuse.service
 184ms modprobe@loop.service
 171ms systemd-random-seed.service
 168ms systemd-sysctl.service
 165ms systemd-sysusers.service
 148ms systemd-tmpfiles-setup-dev.service
 132ms nginx.service
 131ms systemd-tmpfiles-setup.service
 130ms systemd-journald.service
 123ms systemd-modules-load.service
 116ms ifupdown-pre.service
 112ms systemd-remount-fs.service
 110ms dbus.service
 105ms proc-sys-fs-binfmt_misc.mount
  89ms atd.service
  67ms rpc-statd-notify.service
  64ms systemd-update-utmp.service
  49ms systemd-rfkill.service
  47ms nvmf-autoconnect.service
  44ms alsa-restore.service
  40ms console-setup.service
  34ms wpa_supplicant.service
  31ms user-runtime-dir@1000.service
  30ms sys-fs-fuse-connections.mount
  28ms sys-kernel-config.mount
  27ms systemd-user-sessions.service
  27ms systemd-update-utmp-runlevel.service
  10ms run-rpc_pipefs.mount
pi@pi:~ $ systemd-analyze
Startup finished in 6.701s (kernel) + 5.727s (userspace) = 12.428s
multi-user.target reached after 5.646s in userspace.
```

## Sources

- [Optimize Boot | raspberry-pi-geek.de](https://www.raspberry-pi-geek.de/ausgaben/rpg/2020/06/die-boot-zeit-von-raspbian-optimieren/2/)
- [Optimize Boot | singleboardbytes.com](https://singleboardbytes.com/637/how-to-fast-boot-raspberry-pi.htm)