clear
echo -e "Welcome to the FurAffinity gallery downloader! Please insert the name presented in the URL of the artist you wanna save (example:dragoneer)"
read name
torsocks wget -r --no-clobber http://g6jy5jkx466lrqojcngbnksugrcfxsl562bzuikrka5rv7srgguqbjid.onion/fa/$name/
echo "$name's art has been saved. Enjoy the art!"
exit
