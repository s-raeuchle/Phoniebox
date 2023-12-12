MPD Modifications:

mv /usr/lib/systemd/user/mpd.socket /etc/systemd/system/mpd.socket
mv /usr/lib/systemd/user/mpd.service /etc/systemd/system/mpd.service

sudo mv ~/.config/mpd/mpd.conf /etc/mpd.conf



config:
Disable zeroconf, we don't need to announce mpd's presence on the network (default is yes)
zeroconf_enabled               "no" 

