#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# saving setup folder
curr_dir=`pwd`
dir=`dirname $0`
FILE_PATH=`cd  $dir;pwd`

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core build-essential libssl-dev
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10
nvm use v0.10

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# install heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
ln -sb $FILE_PATH/dotfiles/.dir_colors .
ln -sb $FILE_PATH/dotfiles/.screenrc .
ln -sb $FILE_PATH/dotfiles/.bash_profile .
ln -sb $FILE_PATH/dotfiles/.bashrc .
ln -sb $FILE_PATH/dotfiles/.bashrc_custom .
ln -sf $FILE_PATH/dotfiles/.emacs.d .

# setup vim
sudo apt-get install -y vim
mkdir -p .vim/colors
cp $FILE_PATH/vim/*.vim .vim/colors
cp $FILE_PATH/vim/.vimrc .
