#!/bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$PARENT_PATH"

#install_vim()
#{

#}

install_git()
{
sudo apt-get install -y git

git config --global user.name Radoslaw Kieltyka
git config --global user.email rkieltyka@dataplicity.com
git config credential.helper 'cache --timeout=9000'

git remote add wf-specialproj-pub https://github.com/wildfoundry/specialprojects-public
git remote add wf-specialproj-priv https://github.com/wildfoundry/specialprojects
git remote add wf-wfos https://github.com/wildfoundry/wf-os
git remote add rados https://github.com/Radoslaw-K/rados

vimcheck=$(vim --version | head -n 1 | tr " " "\n" | head -n 1)
if [ $vimcheck == "VIM" ]; then 
    git config --global core.editor vim
fi
}


install_sqlite3()
{
echo "Installing sqlite3 package"
sudo apt-get install -y sqlite3

echo "Adding custom config for sqlite3 package"
cp ../dotfiles/.sqliterc /home/$USER/.sqliterc
}


install_build_tools()
{
sudo apt-get install -y bison libtool build-essential autotools-dev automake
}


install_python_tools()
{
sudo apt-get install -y python-pip
sudo pip install flake8 coverage ipython pexpect
}


install_extras()
{
sudo apt-get install -y cmatrix redshift
}


install_general()
{
sudo apt-get -y install tree httpie terminator silversearcher-ag strace screen inotify-tools
}

##################################    MAIN   ###############################################

if [ $USER == "root" ]; then
    echo "[ERROR] Not allowed to run script as: $USER. Please log in as a different user."
    exit 0
    fi

echo "
Usage: 
source apps.bash
install_<installer>

Available installers:
general
extras
python_tools
build_tools
sqlite3
git
"
