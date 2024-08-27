#!/bin/bash
#GTK_THEME="Catppuccin-Frappe-Standard-Rosewater-dark:dark" \
#QT_WAYLAND_SHELL_INTEGRATION=xdg-shell \
#eval $(keychain --eval --quiet id_ed25519 ~/.ssh/lvl27-nick)
val=$(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
WRL_DRM_DEVICES="/dev/dri/card$val" \
    XDG_CURRENT_DESKTOP=sway \
    QT_QPA_PLATFORMTHEME=qt5ct:qt6ct \
    SDL_VIDEODRIVER=wayland \
    _JAVA_AWT_WM_NONREPARENTING=1 \
    QT_QPA_PLATFORM=wayland \
    XDG_SESSION_DESKTOP=sway \
    SSH_ASKPASS=/usr/bin/ksshaskpass \
    SSH_ASKPASS_REQUIRE=prefer \
    dbus-run-session sway --unsupported-gpu
