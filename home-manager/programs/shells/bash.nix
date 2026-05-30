{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export NIX_MANAGED="1"
    '';
  };
}
