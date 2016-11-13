#!/bin/bash

if [ `whoami` != 'root' ]; then
echo "need to run as root, or with sudo"; exit
fi

#get version number
ubuntu_version=`lsb_release -a 2>/dev/null | grep release -i | cut -f2`
if [ -z "$ubuntu_version" ]; then ubuntu_version="15.10"; fi

echo "###############################"
echo "#     _    ____  _   _ ____   #"
echo "#    / \  |  _ \| | | |  _ \  #"
echo "#   / _ \ | | | | |_| | | | | #"
echo "#  / ___ \| |_| |  _  | |_| | #"
echo "# /_/   \_\____/|_| |_|____/  #"
echo "#=============================#"
echo "#    blackhillsinfosec.com    #"
echo "###############################"                           
echo 
echo "This script will need to associate a user account with all the tools."
echo "Enter the name of a user account you want associated with the install."
echo "If you enter a new account name... It will be created."
echo -n "Enter account name [adhd]: "
read account
echo

if [ ${#account} == 0 ]; then
account="adhd"
fi

grepout=`grep "^$account:x" /etc/passwd`

if [ ${#grepout} == 0 ]; then
echo
echo "Script is creating user: $account"
#adduser $account
fi

echo "Updating Sources"
apt-get update 2>/dev/null 1>/dev/null

echo "Installing pre-dependencies"
while read pa; do
	if [[ $pa != *"#"* ]]; then
		apt-get -y install $pa
	fi
done < package_list.txt

