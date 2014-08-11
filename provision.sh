#!/bin/bash -e

echo "Purging extraneous packages"
sudo apt-get purge unity-webapps-common

echo "Installing basics"
sudo apt-get install vim git indicator-multiload tree eclipse meld curl nmap agave gimp ubuntu-restricted-extras gconf-editor unity-tweak-tool apache2 php5 php5-mysql php5-memcached php5-imap libapache2-mod-php5 mysql-client mysql-server mailutils qbittorrent nautilus-open-terminal postfix libsasl2-modules inkscape mercurial

echo "Setting Nautilus defaults"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.list-view default-zoom-level 'smallest'

echo "Disallow guest and remote log in"
sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
sudo echo "greeter-show-remote-login=false" >> /etc/lightdm/lightdm.conf

echo "Set datetime indicator format"
gsettings set com.canonical.indicator.datetime time-format '24-hour'
gsettings set com.canonical.indicator.datetime show-seconds true
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-week-numbers true
gsettings set com.canonical.indicator.datetime show-year true

echo "Hide keyboard language indicator"
gsettings set com.canonical.indicator.keyboard visible false
