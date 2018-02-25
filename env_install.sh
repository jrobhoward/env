#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! -e ~/go ]]; then
  mkdir ~/go
fi

if [[ -e ~/.bash_profile ]]; then
  mv ~/.bash_profile ~/.bash_profile.$$
fi
ln -s `realpath .bash_profile` ~/.bash_profile

if [[ -e ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc.$$
fi
ln -s `realpath .bashrc` ~/.bashrc

if [[ -e ~/.profile ]]; then
  mv ~/.profile ~/.profile.$$
fi
ln -s `realpath .profile` ~/.profile

if [[ -e ~/.gitconfig ]]; then
  mv ~/.gitconfig ~/.gitconfig.$$
fi
ln -s `realpath .gitconfig` ~/.gitconfig
