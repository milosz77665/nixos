{ ... }:
{
  profiles = {
    dev.enable = true;
    wayland.enable = true;
  };

  hardware = {
    audio.enable = true;
    battery.enable = true;
    bt.enable = true;
    network.enable = true;
    storage.ntfs.enable = true;
  };

  desktop.xdg.enable = true;
  programs = {
    audio.pavucontrol.enable = true;
    battery.acpi.enable = true;
    browsers.brave.enable = true;
    cli-tools.starship.enable = true;
    cli-tools.zellij.enable = true;
    dev.direnv.enable = true;
    dev.vscode.enable = true;
    dev.go.enable = true;
    dev.nodejs.enable = true;
    dev.wireshark.enable = true;
    disk.baobab.enable = true;
    disk.gnome-disk-utility.enable = true;
    disk.udiskie.enable = true;
    disk.disk-utils.enable = true;
    file-managers.nemo.enable = true;
    graphics.gimp.enable = true;
    media.ffmpeg.enable = true;
    media.imv.enable = true;
    media.mpv.enable = true;
    music.spotify.enable = true;
    network.network-manager.enable = true;
    network.qbittorrent.enable = true;
    notes.gnome-text-editor.enable = true;
    notes.obsidian.enable = true;
    office.evince.enable = true;
    office.libreoffice.enable = true;
    office.okular.enable = true;
    office.zathura.enable = true;
    printing.hp.enable = true;
    security.polkit-gnome.enable = true;
    security.seahorse.enable = true;
    security.secrets.enable = true;
    system-utils.gnome-system-monitor.enable = true;
    system-utils.timeshift.enable = true;
    terminals.alacritty.enable = true;
    terminals.ghostty.enable = true;
    tools.qalculate.enable = true;
  };

  theme = {
    cursors.enable = true;
    fonts.enable = true;
    gtk.enable = true;
    icons.enable = true;
    wallpapers.enable = true;
  };
}
