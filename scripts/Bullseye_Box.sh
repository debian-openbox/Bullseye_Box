#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts
sudo chmod -R 755 ~/.scripts

sudo chown -R $(logname):$(logname) /home/$(logname)/
find ~/Bullseye_Box -type d -exec chmod 755 {} \;
find ~/Bullseye_Box -type f -exec chmod 755 {} \;

#sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free
cd ~/Bullseye_Box/scripts
sudo ./non-free.sh

sudo apt-get update

sudo apt install -y xorg lightdm openbox obconf tint2 lxappearance menu bleachbit mpd ncmpcpp geany synaptic doublecmd-common terminator rxvt-unicode ranger 
sudo apt install -y ttf-mscorefonts-installer qbittorrent --no-install-recommends
sudo apt install -y pcmanfm-qt --no-install-recommends

sudo apt-get install -y micro firmware-linux firmware-linux-nonfree firmware-misc-nonfree

sudo apt-get install -y mousepad apt-rdepends compton compton-conf firefox-esr xsel mirage pulseaudio numlockx pavucontrol mlocate vlc arandr apt-file xutils mesa-utils xarchiver htop sysstat acpi hardinfo hddtemp network-manager network-manager-gnome net-tools nmap dnsutils libglu1-mesa xfburn gnome-disk-utility python3-pip fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder gdebi fbxkb mpv curl gmrun xscreensaver galternatives pnmixer sxiv scrot xsettingsd git wmctrl pm-utils arc-theme numix-icon-theme nitrogen policykit-1-gnome udiskie psmisc flameshot package-update-indicator qt5-style-plugins xdotool

cp -Rp ~/Bullseye_Box/.config ~/

cp -p ~/Bullseye_Box/.Xresources ~/

--------------------------------------------------------
# gdrive_download long_google_drive_file_id filename.ext
cp -p ~/Bullseye_Box/.bash_aliases ~/ 
--------------------------------------------------------

cp -p ~/Bullseye_Box/keyboard.sh ~/

sudo cp -p ~/Bullseye_Box/rs.png /usr/share/fbxkb/images/rs.png

sudo cp ~/Bullseye_Box/ncmpcpp_48x48.png /usr/share/icons

#sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

#sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Bullseye_Box/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Bullseye_Box/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Bullseye_Box/start-compton.sh ~/bin
sudo chmod -R 755 ~/bin

## instalacija ncmpcpp
cp -Rp ~/Bullseye_Box/.ncmpcpp ~/
cp -Rp ~/Bullseye_Box/.mpd ~/
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp -p ~/Bullseye_Box/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp -p ~/Bullseye_Box/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
# cp -p ~/Bullseye_Box/scripts/settings_geany ~/.scripts
# cd ~/.scripts
# sudo ./settings_geany

## obmenu-generator
cp -p ~/Bullseye_Box/scripts/obmenu-generator.sh ~/.scripts

# mkdir ~/projects
# cd ~/projects
# git clone https://github.com/speja969/debian-openbox.git

# cd ~/projects/debian-openbox/10_openbox_terminator
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
# sudo ./install.sh

cd /home/$(logname)/Bullseye_Box/scripts && sudo ./wps-office.sh
cd /home/$(logname)/Reports
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cd /home/$(logname)/Bullseye_Box/scripts/
sudo ./install_missing_wps_fonts.sh

# dt-dark-theme
cp -pR /home/$(logname)/Bullseye_Box/.themes /home/$(logname)/


# cd ~/projects/debian-openbox/10_openbox_conky
# sudo ./install.sh

# cd ~/projects/debian-openbox/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_nomacs-viewer
# sudo ./install.sh
# sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openbox/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Bullseye_Box/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Bullseye_Box/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Bullseye_Box/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

#sudo chmod --recursive 777 ~/.config

## setting default text editor
xdg-mime default pcmanfm-qt.desktop inode/directory


## settings htop.desktop & ranger.desktop files
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

mkdir -p ~/.urxvt/ext
cp -p ~/Bullseye_Box/ext/* ~/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

cd ~/Bullseye_Box/scripts/openbox_conky
sudo ./install.sh

cd ~/Bullseye_Box/scripts/install_vim/
sudo ./install.sh

#sudo chown -R $(logname):$(logname) /home/$(logname)/
#find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
#find /home/$(logname) -type f | xargs sudo chmod 700

