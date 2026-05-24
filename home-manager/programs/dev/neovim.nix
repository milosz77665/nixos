{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgsUnstable; [
    neovim 
    tree-sitter
    gcc
    # lang servers
    gopls
    typescript-language-server 
    vue-language-server   
  ];
}