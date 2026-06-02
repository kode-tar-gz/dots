# Instructions for my Void Linux configuration

First of all, get the minimal ISO and go through the full installation and configuration.
Then, get Xorg and other essential packages installed:
```bash
sudo xbps-install -S xorg-minimal xorg-fonts xorg-input-drivers base-devel git libX11-devel libXft-devel libXinerama-devel xwallpaper NetworkManager dbus picom
```
and enable NetworkManager and dbus:
```bash
ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/NetworkManager /var/service/
```
PS: Don't forget to install GPU drivers around here too.


Then install my login manager:
```bash
sudo xbps-install -S greetd tuigreet
```
put the config file in `/etc/greetd/config.toml` and enable the greetd service.
PS: If the login tuigreet looks weird, you might have to change some things in your GRUB config.


At this point, you should go ahead and install and patch dwm and dmenu. Don't forget to install the necessary fonts (Hack font and Hack nerd font) and a terminal emulator (Alacritty). Symlink the provided config files into the actual source.
You'll also need to edit the SUDOERS file to allow shutdown and zzz to be run without sudo (for the sysmenu script):
`sudo visudo -f /etc/sudoers.d/zz_kode_powermenu`, then set that file to:
```bash
kode ALL=(ALL) NOPASSWD: /usr/bin/shutdown, /usr/bin/zzz, /usr/sbin/shutdown, /usr/sbin/zzz
```


Then, set up dark mode globally for other applications to look nice:
```bash
mkdir -p ~/.config/gtk-3.0
vim ~/.config/gtk-3.0/settings.ini
```
write this in `settings.ini`:
```toml
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
```


That should be kind of it; There are definitely other packages you'll need to install to make everything work but this should cover the main roadblocks I ran into and allow you to get this installation running in a couple hours.
