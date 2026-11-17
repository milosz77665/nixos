{ localLib }:
let
  mkHostIfVars = localLib.flake.mkHostIfVars ./.;
in
{
  nixosConfigurations =
    mkHostIfVars "main" localLib.builders.mkSystem { }
    // mkHostIfVars "lowSpec" localLib.builders.mkSystem { };

  homeConfigurations = mkHostIfVars "home" localLib.builders.mkHome { };

  nixOnDroidConfigurations = mkHostIfVars "nixOnDroid" localLib.builders.mkNixOnDroid { };
}
