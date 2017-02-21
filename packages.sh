#!/bin/sh

# Apt stuff
apt-get update && apt-get upgrade -y
apt-get install -y $(cat 'packages.txt')

# Install Atom
ATOM_DEB=atom.deb
ATOM_URL=https://github.com/atom/atom/releases/download/v1.14.3/atom-amd64.deb
curl -o $ATOM_DEB $ATOM_URL
dpkg -i $ATOM_DEB
rm $ATOM_DEB # we can't delete this as not root, sadly
