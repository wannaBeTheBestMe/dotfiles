#!/bin/sh

# Not yet added:
    # `neomutt`
    # `neovide`
    # `llvm`, `clang`
    # blueberry (depends on `gnome-bluetooth`)
    # ipwebcam-gst-git (for using a smartphone as a webcame)
    # `asusctl`, `supergfxctl` (ASUS G14 specific kernel installation as well)
    # `davinci-resolve`
    # `gimp`
    # ComicMono Nerd Font
    # `jre-opendek`, `jdk-openjdk`
    # `languagetool`
    # `espeak`
    # `pandoc`
    # `peazip-gtk2-bin`
    # `libreoffice-fresh` (Yar icon theme)

# Not yet implemented:
    # Change default icon theme to the new one
    # Change default cursor theme to the new one
    # Add the 'Hindi - openitransv2 (m17n) layout'
    # Fix CPU temperatures with `sudo echo 0 > /sys/devices/system/cpu/cpufreq/boost`
    # Automated installation of the LSP servers I use in NeoVim
    # Chrome extension that enables touchpad zoom gestures
    # Does Pipewire automatically take over from PuleAudio after installing the relevant packages?
    # `~/.config/mimeapps.list` configuration
    # Changing locales to `en_US`?
    # Commandline equivalent to `peazip-gtk2-bin`

# Potential further improvements
    # Use something custom instead of `vimv-git`
    # RSS reader
    # `variety` substitute of some sort
    # Perhaps move from JetBrains Mono to SF Mono

# Implement code which allows the dotfiles to be moved accordingly

paru -S --noconfirm papirus-icon-theme nerd-fonts-jetbrains-mono rofi lf discord xclip flameshot texlive-most biber latexmk broot sxiv phinger-cursors mpv picom-git python-pip pynvim light-git ibus-m17n yt-dlp calc noto-fonts-emoji nodejs npm cmake fd tmux gdb pipewire pipewire-media-session pipewire-alsa pipewire-jack pipewire-zeroconf pipewire-pulse hugo figma-linux-bin entr mypy cronie arandr font-manager-git dmenu ttf-poppins sanskrit-fonts glow xdg-ninja-git timeshift-gtk openssh tdrop cmatrix-git unimatrix-git lrzip mpd mpc mpdris2 ncmpcpp vimv-git nerd-fonts-sf-mono

sudo systemctl enable cronie
sudo systemctl start cronie
sudo systemctl start sshd

