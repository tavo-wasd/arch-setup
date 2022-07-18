#!/bin/sh

echo "
    _             _       ____       _
   / \   _ __ ___| |__   / ___|  ___| |_ _   _ _ __
  / _ \ | '__/ __| '_ \  \___ \ / _ \ __| | | | '_  |
 / ___ \| | | (__| | | |  ___) |  __/ |_| |_| | |_) |
/_/   \_\_|  \___|_| |_| |____/ \___|\__|\__,_| .__/
                                              |_|
 ____            _       _
/ ___|  ___ _ __(_)_ __ | |_
\___ \ / __| '__| | '_ \| __|
 ___) | (__| |  | | |_) | |_
|____/ \___|_|  |_| .__/ \__|
                  |_|
"

cd
sudo pacman -Syyu
#sudo pacman -S packagekit-qt5 (Discover app store)

# YAY AUR HELPER -------------------
while true; do
    read -p "Install yay AUR helper? [y/n]" yn
    case $yn in
        [Yy]* )
        # Manual build from AUR:
            cd /tmp
            sudo git clone https://aur.archlinux.org/yay.git
            sudo chown -R tavo:tavo ./yay
            cd yay
            makepkg -si
            sudo yay -Syu
            cd
        # OR, for Manjaro/pamac:
            #pamac build yay # (IF you uncomment this line, comment the git clone alternative above and viceversa)

        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
cd

## EXTRAS & APPS --------------------
# Extras
    #sudo pacman -S flatpak
    # Asian Fonts
    sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts
    # MS Fonts
    sudo yay -S ttf-ms-fonts
    # Emojis
    sudo pacman -S noto-fonts-emoji
    # Multimedia codecs
    sudo pacman -S --needed jasper libdca libdv gst-libav wavpack dvd+rw-tools dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfatprogs fuse-exfat a52dec faac faad2 jre-openjdk ntfs-3g git curl lame libtheora libvorbis libxv x264 xvidcore flac ffmpeg
    # Printing support
    sudo pacman -S cups cups-pdf
    sudo systemctl enable --now cups
    sudo pacman -S system-config-printer
    #sudo yay -S epson-inkjet-printer-escpr # MY PRINTER
    #(vim /etc/locale.gen)

# Apps (COMMENT or UNCOMMENT to your liking)
    # Basics
    sudo pacman -S chromium alacritty ranger pcmanfm-gtk3 gvim gvfs #dhcpcd
    # Office & Utils
    sudo pacman -S libreoffice-fresh vlc neofetch mupdf scrot feh rofi rofi-emoji libvirt #libqalculate alsa-utils ninja gnome-boxes gwenview kdeconnect spectacle 
    # Creative
    sudo pacman -S gimp darktable audacity obs-studio kdenlive #ardour inkscape
    # Games
    yay -S game-devices-udev steam minecraft-launcher
    # Communication
    sudo pacman -S discord thunderbird
    # Other (Add our own packages)

# Laptops (COMMENT or UNCOMMENT to your liking)
    # Power Management
    yay -S auto-cpufreq tlp
    # Screen
    sudo pacman -S brightnessctl

# GROUPS
    sudo usermod -a -G sys,network,scanner,power,libvirt,rfkill,users,video,storage,optical,lp,audio,root tavo

# End ------------------------------
echo "
 _____ _   _ ____
| ____| \ | |  _
|  _| |  \| | | | |
| |___| |\  | |_| |
|_____|_| \_|____/
"

echo "
Be sure to:

Add Web Apps
    Whatsapp
    Telegram
    Zoom
    Teams
    Keep
    Drive
"
