{ vars, ... }:
{
  sys = {
    tools.timeshift.enable = true;
    wm-x11.betterlockscreen.enable = true;
    printing.hp.enable = true;
    secrets.enable = true;
  };

  hardware = {
    audio.enable = true;
    battery.enable = true;
    bt.enable = true;
    network.enable = true;
    storage.ntfs.enable = true;
  };

  core.display-server = "x11";
  programs = {
    audio.pavucontrol.enable = true;
    battery.acpi.enable = true;
    browsers.brave.enable = true;
    browsers.chrome.enable = true;
    browsers.firefox.enable = true;
    cli-tools.atuin.enable = true;
    cli-tools.lazydocker.enable = true;
    cli-tools.lazygit.enable = true;
    cli-tools.starship.enable = true;
    cli-tools.yazi.enable = true;
    cli-tools.zellij.enable = true;
    communicators.discord.enable = true;
    dev.direnv.enable = true;
    dev.drawio.enable = true;
    dev.git.enable = true;
    dev.neovim.enable = true;
    dev.postman.enable = true;
    dev.vscode.enable = true;
    dev.nodejs.enable = true;
    disk.baobab.enable = true;
    disk.gnome-disk-utility.enable = true;
    disk.udiskie.enable = true;
    disk.disk-utils.enable = true;
    desktop.sddm.enable = true;
    desktop.xdg.enable = true;
    file-managers.nemo.enable = true;
    gaming.heroic.enable = true;
    gaming.lutris.enable = true;
    gaming.steam.enable = true;
    gaming.wine.enable = true;
    graphics.gimp.enable = true;
    media.ffmpeg.enable = true;
    media.imv.enable = true;
    media.mpv.enable = true;
    music.spotify.enable = true;
    tools.flameshot.enable = true;
  };

  usr = {
    desktop.fonts.enable = true;
    gtk.enable = true;
    desktop.wallpapers.enable = true;
    network.network-manager.enable = true;
    notes.gnome-text-editor.enable = true;
    notes.obsidian.enable = true;
    notifications.dunst.enable = true;
    secrets.polkit-gnome.enable = true;
    secrets.seahorse.enable = true;
    shells.bash.enable = true;
    terminals.alacritty.enable = true;
    terminals.ghostty.enable = true;
    tools.evince.enable = true;
    tools.gnome-system-monitor.enable = true;
    tools.libreoffice.enable = true;
    tools.okular.enable = true;
    tools.qalculate.enable = true;
    tools.qbittorrent.enable = true;
    tools.zathura.enable = true;
    wm-x11.arandr.enable = true;
    wm-x11.feh.enable = true;
    wm-x11.high-dpi.enable = true;
    wm-x11.picom.enable = true;
    wm-x11.pywal.enable = true;
    wm-x11.qtile.enable = true;
    wm-x11.rofi.enable = true;
    wm-x11.xclip.enable = true;
  };
}
