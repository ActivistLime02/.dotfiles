#!/bin/bash
val=$(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
WRL_DRM_DEVICES="/dev/dri/card$val" \
    XDG_CURRENT_DESKTOP=sway \
    QT_QPA_PLATFORMTHEME=qt6ct \
    SDL_VIDEODRIVER=wayland \
    _JAVA_AWT_WM_NONREPARENTING=1 \
    QT_QPA_PLATFORM=wayland \
    XDG_SESSION_DESKTOP=sway \
    dbus-run-session sway --unsupported-gpu
