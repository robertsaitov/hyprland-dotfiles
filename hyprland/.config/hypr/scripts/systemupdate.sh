#!/usr/bin/env bash

# Check release
if [ ! -f /etc/fedora-release ] ; then
    exit 0
fi

# source variables
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh

# Check for updates
ofc=`dnf check-update | wc -l`

# Check for flatpak updates
if pkg_installed flatpak ; then
    fpk=`flatpak remote-ls --updates | wc -l`
    fpk_disp="\n󰏓 Flatpak $fpk"
    fpk_exup="; flatpak update"
else
    fpk=0
    fpk_disp=""
fi

# Check for npm global updates
if command -v npm &> /dev/null ; then
    npm_outdated=$(npm outdated -g --depth=0 2>/dev/null | tail -n +2 | wc -l)
    npm_disp="\n npm $npm_outdated"
    npm_exup="; npm update -g"
else
    npm_outdated=0
    npm_disp=""
fi

# Calculate total available updates
upd=$(( ofc + fpk + npm_outdated ))

# Show tooltip
if [ $upd -eq 0 ] ; then
    echo "{\"text\":\"$upd\", \"tooltip\":\" Packages are up to date\"}"
else
    echo "{\"text\":\"$upd\", \"tooltip\":\"󱓽 Official $ofc$fpk_disp$npm_disp\"}"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    kitty --title systemupdate sh -c "sudo dnf upgrade $fpk_exup$npm_exup"
fi

