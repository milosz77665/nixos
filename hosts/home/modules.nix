{ vars, ... }:
{
  core.display-server = "wayland";
  programs = {
    cli-tools.atuin.enable = true;
    cli-tools.lazydocker.enable = true;
    cli-tools.lazygit.enable = true;
    cli-tools.starship.enable = true;
    cli-tools.yazi.enable = true;
    cli-tools.zellij.enable = true;
    dev.neovim.enable = true;
    desktop.xdg.enable = true;
    tools.flameshot.enable = true;
  };

  usr = {
    desktop.fonts.enable = true;
    gtk.enable = true;
    desktop.wallpapers.enable = true;
    file-managers.nemo.enable = true;
    network.network-manager.enable = true;
    shells.bash.enable = true;
    terminals.ghostty.enable = true;
    wm-wayland.fuzzel.enable = true;
    wm-wayland.niri.enable = true;
    wm-wayland.ozone.enable = true;
    wm-wayland.swaybg.enable = true;
    wm-wayland.swaylock.enable = true;
    wm-wayland.swaync.enable = true;
    wm-wayland.waybar.enable = true;
    wm-wayland.wdisplays.enable = true;
    wm-wayland.clipboard.enable = true;
  };
}
