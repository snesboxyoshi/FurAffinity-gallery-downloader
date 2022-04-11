clear
echo -e "Welcome to the manual version of the FurAffinity gallery downloader! This version assumes that you have more than 2 brain cells, know how to install the required packages for this to work (torsocks, grep, parallel, tor, wget.), and know how to enable and start the ((tor)) service under whatever thing your distro uses to run services (Since most mainstream distros use systemd, it would be: systemctl enable tor | systemctl start tor)"
echo ""
echo "Please insert the name presented in the URL of the artist you wanna save (example:dragoneer)"
read name
mkdir $name
sudo chmod 777 $name
cd "$name"
torsocks -P 9050 curl http://g6jy5jkx466lrqojcngbnksugrcfxsl562bzuikrka5rv7srgguqbjid.onion/fa/$name/ | grep -Po '(?<=href=")[^"]*(?=")'| parallel torsocks wget --no-clobber http://g6jy5jkx466lrqojcngbnksugrcfxsl562bzuikrka5rv7srgguqbjid.onion/fa/$name/{}
clear
echo "$name's art has been saved in the /$name/ directory where you placed the script. Enjoy the art!"
exit
