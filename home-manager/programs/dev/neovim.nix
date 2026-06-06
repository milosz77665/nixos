{ pkgs, ... }:
{
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
    # Formatters
    stylua
    nixfmt-rfc-style
    kdlfmt
  ];
}
