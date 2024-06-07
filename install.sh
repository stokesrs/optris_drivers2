#!/bin/bash

# Copied from the optris rdmanifest, which was not working
arch="$(uname -m)"
if [ "$arch" == "atom" ]; then
pkgarch="atom"
elif [ "$arch" == "armhf" ]; then
pkgarch="armhf"
elif [ "$arch" == "armel" ]; then
pkgarch="armel"
elif [ "$arch" == "arm64" ]; then
pkgarch="arm64"
elif [ "$arch" == "x86_64" ]; then
pkgarch="amd64"
else
pkgarch="i386"
fi

url="http://ftp.evocortex.com/libirimager-latest?arch=$pkgarch&type=deb"
pkg="libirimager-latest_$pkgarch.deb"
wget --no-check-certificate -O $pkg $url

# If running manually, must run under sudo. In apptainer, sudo will not work
dpkg -i $pkg

# This script is for automatic updates, so we remove the package after we're done
rm $pkg
