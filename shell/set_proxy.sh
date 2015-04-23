#!/bin/bash
# @Script set_proxy.sh
# @Author Swapnil Agarwal
# @Purpose To automate setting up proxy
# @Usage ./set_proxy.sh
# Copyright (c) 2013 Swapnil Agarwal
# Permission to copy and modify is granted under MIT License

echo When any file opens, paste the clipboard content and save before closing gedit.
echo -n Enter proxy:
read proxy
echo -n Enter port:
read port
read -p "Authorization required? [Y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -n Enter username:
    read user
    echo -n Enter password:
    read pass
    p=$user:$pass@$proxy:$port
else
    p=$proxy:$port
fi

if [ $(dpkg-query -W -f='${Status}' xclip | grep -c "install ok installed") -eq 0 ];
then
    sudo http_proxy=http://$p apt-get update
    sudo http_proxy=http://$p apt-get install xclip
fi

echo -e -n "
export http_proxy=http://$p
export https_proxy=http://$p
export ftp_proxy=http://$p
" | xclip -sel clip
sudo gedit /etc/bash.bashrc

echo -e -n "
Acquire::http::proxy \"http://$p\";
Acquire::https::proxy \"http://$p\";
Acquire::ftp::proxy \"http://$p\";
Acquire::http::No-Cache \"True\";
" | xclip -sel clip
sudo gedit /etc/apt/apt.conf

echo -e -n "
http_proxy=http://$p
https_proxy=https://$p
ftp_proxy=ftp://$p
" | xclip -sel clip
sudo gedit /etc/wgetrc
