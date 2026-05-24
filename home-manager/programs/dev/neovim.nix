{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    neovim 
    tree-sitter
    # lang servers
    gopls
    typescript-language-server 
    vue-language-server   
    lua-language-server
  ];
}
