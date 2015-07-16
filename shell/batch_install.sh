packages=( "autokey-qt" "codeblocks" "eclipse" "gitg" "guake" "idle" "mplayer" "netbeans" "vlc" "xclip" "xdotool" "zsh")

for i in "${packages[@]}"
do
    if [ $(dpkg-query -W -f='${Status}' $i | grep -c "install ok installed") -eq 0 ];
    then
        sudo -E apt-get -y install $i
    fi
done
