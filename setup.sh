f#! /bin/sh
echo "
    _             _       ____       _
   / \   _ __ ___| |__   / ___|  ___| |_ _   _ _ __
  / _ \ | '__/ __| '_ \  \___ \ / _ \ __| | | | '_
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
sudo pacman -S packagekit-qt5
## GRAPHICS DRIVERS -----------------
while true; do
    read -p "Install NVIDIA proprietary drivers? [y/n]" yn
    case $yn in
        [Yy]* )
        # For Manjaro: (IF uncommented, comment the next command)
            #sudo mhwd -a pci nonfree 0300
        # For any Arch-based distro:
            sudo pacman -S nvidia

        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd
## PAMAC ----------------------------
while true; do
    read -p "Install pamac? [y/n]" yn
    case $yn in
        [Yy]* )
        # Manual build from AUR:
            #sudo pacman -S git # UNCOMMENT line start if you already have git
            cd /opt
            sudo git clone https://aur.archlinux.org/snapd.git
            sudo chown -R tavo:tavo ./snapd
            cd snapd
            makepkg -si
            cd /opt
            sudo git clone https://aur.archlinux.org/snapd-glib.git
            sudo chown -R tavo:tavo ./snapd-glib
            cd snapd-glib
            makepkg -si
            cd /opt
            sudo git clone https://aur.archlinux.org/archlinux-appstream-data-pamac.git
            sudo chown -R tavo:tavo ./archlinux-appstream-data-pamac
            cd archlinux-appstream-data-pamac
            makepkg -si
            cd /opt
            sudo git clone https://aur.archlinux.org/pamac-all.git
            sudo chown -R tavo:tavo ./pamac-all
            cd pamac-all
            makepkg -si
            cd /opt
            sudo git clone https://aur.archlinux.org/libpamac-full.git
            sudo chown -R tavo:tavo ./libpamac-full
            cd libpamac-full
            makepkg -si
            cd
            sudo pacman -S libhandy
            cd /opt
            sudo git clone https://aur.archlinux.org/pamac-all.git
            sudo chown -R tavo:tavo ./pamac-all
            cd pamac-all
            makepkg -si
            cd

        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd
## YAY AUR HELPER -------------------
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
## WEB BROWSER ----------------------
## Install Google Chrome and (optionally) remove Firefox
while true; do
    read -p "Install Google Chrome? [y/n]" yn
    case $yn in
        [Yy]* )
        # Manual build from AUR:
            sudo yay -S google-chrome
        # For Manjaro/pamac:
            #pamac build google-chrome # (IF uncommented, comment the commands above)
            cd
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

## EXTRAS & APPS --------------------
## Remove Firefox
cd
while true; do
    read -p "Remove Firefox? [y/n]" yn
    case $yn in
        [Yy]* )
            sudo pacman -R firefox;
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

## Extras
    sudo yay -S ttf-ms-fonts
    # Asian Fonts
    sudo pacman -S flatpak
    # MS Fonts
    sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts
    # Emojis
    sudo pacman -S noto-fonts-emoji
    # Multimedia codecs (LEAVE COMMENTED for Manjaro)
    sudo pacman -S --needed jasper libdca libdv gst-libav wavpack dvd+rw-tools dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfat-utils fuse-exfat a52dec faac faad2 jre-openjdk ntfs-3g git curl lame libtheora libvorbis libxv x264 xvidcore flac ffmpeg
    # Printing support
    sudo pacman -S cups cups-pdf
    sudo systemctl enable --now cups
    sudo pacman -S system-config-printer
    #sudo yay -S epson-inkjet-printer-escpr # MY PRINTER
    #(vim /etc/locale.gen)

## Apps (COMMENT or UNCOMMENT to your liking)

    ## Office & Utils
    sudo pacman -S libreoffice-fresh vlc neofetch #ninja gnome-boxes gwenview kdeconnect spectacle
    ## Creative
    sudo pacman -S gimp darktable pitivi ardour inkscape audacity obs-studio #kdenlive
    ## Games
    sudo yay -S game-devices-udev steam minecraft-launcher
    ## Communication
    sudo yay -S discord telegram-desktop thunderbird #zoom
    flatpak install flathub com.microsoft.Teams
    flatpak install flathub us.zoom.Zoom
    ## Other (Add our own packages)
    sudo yay -S chrome-gnome-shell
    flatpak install flathub com.spotify.Client com.system76.Popsicle

while true; do
    read -p "Install timeshift? [y/n]" yn
    case $yn in
        [Yy]* )
            cd /tmp
            sudo git clone https://aur.archlinux.org/timeshift.git
            sudo chown -R tavo:tavo ./timeshift
            cd timeshift
            makepkg -si
            cd
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

## GROUPS
sudo usermod -a -G sys,network,scanner,power,libvirt,rfkill,users,video,storage,optical,lp,audio,root tavo
## End ------------------------------

echo "
 _____ _   _ ____
| ____| \ | |  _
|  _| |  \| | | | |
| |___| |\  | |_| |
|_____|_| \_|____/
"

echo "
Be sure to:

Customize
    Panel (taskbar)
    Wallpaper
    Light/dark theme
    Keyboard shortcuts

Add Web Apps
    Whatsapp
    Keep
    Drive
"
#COMMIT TO GITHUB:
# Moved usermod command to end (LINE 186)
# Added KDE apps, KDE Connect, Spectacle, Gwenview (line 157)
# Commented archinstall default installed dependencies (LINE 147)
# Previoulsy built packages are now automatically built with yay (except timeshift)
# Added extras: ninja
