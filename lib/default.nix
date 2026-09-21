{ inputs, ... }:
{
  builders = {
    mkSystem = import ./builders/mkSystem.nix { inherit inputs; };
    mkNixOnDroid = import ./builders/mkNixOnDroid.nix { inherit inputs; };
  };
}
