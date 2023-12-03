# Finaly these services are running on the pi4 bookworm

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