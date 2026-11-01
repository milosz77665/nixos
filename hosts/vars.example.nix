# Copy this file to hosts/<host>/vars.nix and fill in the placeholders.
# hosts/<host>/vars.nix is ignored by git.
#
# Preferred: local builds use path:$PWD so Nix sees the untracked vars file:
#   sudo nixos-rebuild switch --flake path:$PWD#main
#   home-manager switch --flake path:$PWD#home
#   nix-on-droid switch --flake path:$PWD#nixOnDroid
#
# Alternative: make the file visible to a normal .# build by staging it:
#   git add -f hosts/<host>/vars.nix
# (or temporarily uncomment the hosts/*/vars.nix rule in .gitignore).
# Do not commit it and unstage it after the build; .gitignore does not
# protect staged or tracked files.
#
# To switch between several vars files, keep them outside the repository and
# point hosts/<host>/vars.nix at the active one, for example:
#   ln -sfn ~/.config/nixos-vars/personal.nix hosts/home/vars.nix

rec {
  user = {
    name = "alice";
    fullName = "Alice Smith";
  };

  stateVersion = "25.11";

  # Linux: "/home/${user.name}", macOS: "/Users/${user.name}",
  # nix-on-droid: "/data/data/com.termux.nix/files/home".
  homeDirectory = "/home/${user.name}";

  git = {
    username = "Alice Smith";
    email = "alice@example.com";
  };
}
