#!/bin/sh

GIT_BASE='https://raw.githubusercontent.com/treyzania/cozy-nix/master'

# Temp directory
mkdir tmp
cd tmp

# Install some packages.
wget $GIT_BASE/packages.txt
wget $GIT_BASE/packages.sh
chmod +x packages.sh
sudo ./packages.sh

# rustup
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src
source ~/.cargo/env

# Atom packages
wget $GIT_BASE/atom.txt
for p in $(cat 'atom.txt'); do
	apm install $p
done

# Atom config
wget $GIT_BASE/atom-config.cson
cp -f atom-config.cson ~/.atom

# Make a few directories
mkdir -p ~/dev/git

# Firefox addons
wget $GIT_BASE/firefox.sh
chmod +x firefox.sh
./firefox.sh

# Cleanup
cd ..
rm -rf tmp
