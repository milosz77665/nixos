{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.dev.neovim;
in
{
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      extraWrapperArgs = [
        "--set" "NIX_MANAGED" "1"
      ];
    };

    home.packages = with pkgs; [
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
