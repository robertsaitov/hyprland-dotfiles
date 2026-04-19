#!/bin/bash
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal
sleep 1
if command -v xdg-desktop-portal-hyprland >/dev/null 2>&1; then
    setsid -f xdg-desktop-portal-hyprland
elif [ -x /usr/libexec/xdg-desktop-portal-hyprland ]; then
    setsid -f /usr/libexec/xdg-desktop-portal-hyprland
fi
sleep 2
if command -v xdg-desktop-portal-gtk >/dev/null 2>&1; then
    setsid -f xdg-desktop-portal-gtk
elif [ -x /usr/libexec/xdg-desktop-portal-gtk ]; then
    setsid -f /usr/libexec/xdg-desktop-portal-gtk
fi
sleep 1
if command -v xdg-desktop-portal >/dev/null 2>&1; then
    setsid -f xdg-desktop-portal
elif [ -x /usr/libexec/xdg-desktop-portal ]; then
    setsid -f /usr/libexec/xdg-desktop-portal
fi
