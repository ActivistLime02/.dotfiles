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

# Full RGB range output
modetest -M xe -c | awk '/^[0-9]+\t/ {c=$1} /Broadcast RGB/ {print c, $1}' |
while read conn prop; do
    proptest -M xe -D /dev/dri/card0 "$conn" connector "$prop" 1
done

# for keyboard switching and ime
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# for java applications
export _JAVA_AWT_WM_NONREPARENTING=1

# for integration with kwallet and ssh
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

# for kde appplication theming
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland

# for programs that expect google-chrome
export CHROME_EXECUTABLE=google-chrome-stable

# for android SDK
export ANDROID_HOME=~/Android/Sdk/

# For ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# dbus-run-session sway --unsupported-gpu
sway
