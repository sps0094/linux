echo "Increase DPI for namperumal...."
xfconf-query -c xsettings -p /Xft/DPI -s 141
echo "Set Root...."
sudo passwd root
su - root
echo "Increase DPI for root...."
xfconf-query -c xsettings -p /Xft/DPI -s 141
echo "Start update-grub...."
update-grub
echo "Fix Repositories...."
sed -i '$ a nameserver 8.8.8.8' /etc/resolv.conf
sed -i '$ a nameserver 8.8.4.4' /etc/resolv.conf
sed -i '1 i deb http://kali.cs.nctu.edu.tw/kali kali-rolling main contrib non-free' /etc/apt/sources.list
sed -i '1 i deb-src http://kali.cs.nctu.edu.tw/kali kali-rolling main contrib non-free' /etc/apt/sources.list
echo "Begins to install rtl8723de"
apt update && sudo apt install git dkms
cd /home/namperumal/Downloads
git clone -b extended --single-branch https://github.com/lwfinger/rtlwifi_new.git
cd rtlwifi_new
dkms add ../rtlwifi_new
dkms build rtlwifi-new/0.6 
dkms install rtlwifi-new/0.6
modprobe -v rtl8723de ant_sel=2
/bin/sh -c 'echo "options rtl8723de ant_sel=2" >> /etc/modprobe.d/rtl8723de.conf'
echo "Connecting to namperumal_2.4"
ifconfig eth0 down
ifconfig wlan0 up
nmcli d wifi connect namperumal_2.4 password EXfZs?ny}D?0HJ1~vPWc
echo "Begins to install blueman.... and sometimes installs python"
apt-get update
apt-get install blueman
/etc/init.d/bluetooth restart
echo "Install system monitor...."
apt-get install gnome-system-monitor
echo "Install Tor...."
apt install torbrowser-launcher
echo "Install VLC...."
apt install vlc
echo "Install QBIt"
apt install qbittorrent
echo "Post installation script completed. Proceed to install python latest if not installed, pycharm, xdm, vlc....."
