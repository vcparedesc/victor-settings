ip link
ip link set wlo1 up
sudo iwlist wlo1 scan | grep ESSID
sudo /etc/init.d/network-manager start
nmcli dev wifi connect free_wifi password itisnotfree
sudo iw wlo1 link
