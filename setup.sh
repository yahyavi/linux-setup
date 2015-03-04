#!/bin/bash
# Simple setup.sh for configuring Ubuntu
# for headless setup. 

# saving setup folder
curr_dir=`pwd`
dir=`dirname $0`
FILE_PATH=`cd  $dir;pwd`

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core build-essential libssl-dev
wget https://raw.github.com/creationix/nvm/master/install.sh
bash install.sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.12
nvm use v0.12

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# git pull and install dotfiles as well
cd $HOME
cp -b $FILE_PATH/dotfiles/.dir_colors .
cp -b $FILE_PATH/dotfiles/.screenrc .
cp -b $FILE_PATH/dotfiles/.bash_profile .
cp -b $FILE_PATH/dotfiles/.bashrc .
cp -b $FILE_PATH/dotfiles/.bashrc_custom .

# setup vim
sudo apt-get install -y vim
mkdir -p .vim/colors
cp $FILE_PATH/vim/*.vim .vim/colors
cp $FILE_PATH/vim/.vimrc .
