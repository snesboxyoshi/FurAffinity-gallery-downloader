_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ] ; then
        echo 0 #'0' means 'true' in Bash
        return #true
    fi
    echo 1 #'1' means 'false' in Bash
    return #false
    }

_installMany() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
        continue
     fi

        #Otherwise, add it to the list of packages to install.
        toInstall+=("${pkg}")
    done

        #If no packages were added to the "${toInstall[@]}" array,
        #don't do anything and stop this function.
        if [[ "${toInstall[@]}" == "" ]] ; then
             return
             fi


             # Otherwise, install all the packages that have been added to the "${toInstall[@]}" array.
    printf "Packages not installed:\n%s\n" "${toInstall[@]}"
    sudo pacman -S "${toInstall[@]}"
    }

    _installMany "torsocks" "grep" "parallel" "tor" "wget"

sudo systemctl enable tor
sudo systemctl start tor

clear
echo -e "Welcome to the FurAffinity gallery downloader! Please insert the name presented in the URL of the artist you wanna save (example:dragoneer)"
read name
torsocks wget -r --no-clobber http://g6jy5jkx466lrqojcngbnksugrcfxsl562bzuikrka5rv7srgguqbjid.onion/fa/$name/
echo "$name's art has been saved. Enjoy the art!"
exit
