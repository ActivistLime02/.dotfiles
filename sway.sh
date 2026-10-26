#!/bin/bash
#GTK_THEME="Catppuccin-Frappe-Standard-Rosewater-dark:dark" \
#QT_WAYLAND_SHELL_INTEGRATION=xdg-shell \
#eval $(keychain --eval --quiet id_ed25519 ~/.ssh/lvl27-nick)
# val=$(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
# WRL_DRM_DEVICES="/dev/dri/card$val" \
# WLR_RENDERER=vulkan \
# XDG_SESSION_DESKTOP=sway \
# XDG_CURRENT_DESKTOP=sway \
# SDL_VIDEODRIVER=wayland \
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export _JAVA_AWT_WM_NONREPARENTING=1
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland \
# dbus-run-session sway --unsupported-gpu
sway
