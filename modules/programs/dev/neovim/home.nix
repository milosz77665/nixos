{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.neovim or config.usr.dev.neovim;
in
{
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
