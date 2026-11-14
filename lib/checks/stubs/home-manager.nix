{ lib }:
{ ... }:
let
  anyAttrs = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
  };
in
{
  options = {
    home = lib.mkOption {
      type = lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
        options = {
          packages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [ ];
          };
          homeDirectory = lib.mkOption {
            type = lib.types.str;
            default = "/home/name";
          };
          username = lib.mkOption {
            type = lib.types.str;
            default = "name";
          };
          stateVersion = lib.mkOption {
            type = lib.types.str;
            default = "25.11";
          };
          sessionVariables = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            default = { };
          };
          file = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
            default = { };
          };
        };
      };
      default = { };
    };

    assertions = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [ ];
    };

    core.display-server = lib.mkOption {
      type = lib.types.enum [
        "wayland"
        "x11"
        "none"
      ];
      default = "none";
    };

    services = anyAttrs;
    systemd.user.services = anyAttrs;
    xdg.configFile = anyAttrs;
    xdg.mimeApps = anyAttrs;
    gtk = anyAttrs;
    dconf.settings = anyAttrs;
    fonts.fontconfig = anyAttrs;
    xresources.properties = anyAttrs;
    terminal = anyAttrs;

    programs = lib.genAttrs [
      "alacritty"
      "atuin"
      "bash"
      "brave"
      "discord"
      "direnv"
      "feh"
      "firefox"
      "fuzzel"
      "ghostty"
      "git"
      "go"
      "google-chrome"
      "lazygit"
      "lutris"
      "neovim"
      "pywal"
      "rofi"
      "starship"
      "swaylock"
      "vscode"
      "waybar"
      "yazi"
      "zellij"
    ] (_: anyAttrs);
  };
}
