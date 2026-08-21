{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.dev.neovim;
in
{
  options.usr.dev.neovim = {
    enable = lib.mkEnableOption "Neovim";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      neovim
      tree-sitter
      # Lang servers
      gopls
      typescript-language-server
      vue-language-server
      lua-language-server
      nixd
      vscode-langservers-extracted
      tailwindcss-language-server
      # Formatters
      stylua
      nixfmt-rfc-style
      kdlfmt
      prettierd
      golangci-lint
    ];
  };
}
