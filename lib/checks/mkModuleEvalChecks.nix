{
  basePath,
  roots,
  nixpkgs,
  nixpkgs-unstable,
  varsPath,
  droidVarsPath,
  checkPkgs,
}:
{ lib, localLib, ... }:
let
  modules = localLib.utils.getModuleDirectories { inherit basePath roots; };

  allDefaults = builtins.map (module: module.path + "/default.nix") modules;

  vars = import varsPath;
  droidVars = import droidVarsPath;

  homeStub = import ./stubs/home-manager.nix { inherit lib; };
  systemStub = import ./stubs/nixos.nix { inherit lib; };
  droidStub = import ./stubs/nix-on-droid.nix { inherit lib; };

  platformLabel =
    system: if system == "x86_64-linux" || system == "aarch64-linux" then "linux" else "darwin";

  displayFor =
    module:
    if lib.hasInfix "wm-x11" module.name then
      "x11"
    else if lib.hasInfix "wm-wayland" module.name then
      "wayland"
    else
      "none";

  # Force module config without forcing package derivations, which may be
  # unsupported on a different platform even though the module evaluates.
  sanitize =
    value:
    if builtins.isAttrs value && (value.type or null) == "derivation" then
      "<package>"
    else if builtins.isAttrs value then
      builtins.mapAttrs (_: sanitize) value
    else if builtins.isList value then
      builtins.map sanitize value
    else
      value;

  evalCheck =
    kind: system: module:
    let
      display = displayFor module;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
      moduleVars = if kind == "droid" then droidVars else vars;
      stub =
        if kind == "home" then
          homeStub
        else if kind == "system" then
          systemStub
        else
          droidStub;

      evaluated = lib.evalModules {
        modules = [
          stub
        ]
        ++ allDefaults
        ++ [
          (lib.setAttrByPath (module.relative ++ [ "enable" ]) true)
          (module.path + "/${kind}.nix")
          { core.display-server = display; }
        ];
        specialArgs = {
          inherit pkgs pkgsUnstable;
          vars = moduleVars;
          isNixos = kind == "system";
          isWayland = display == "wayland";
          hostName = if kind == "droid" then "testDroid" else "test";
        };
      };

      name = "${kind}-${platformLabel system}-${module.name}";
    in
    {
      inherit name;
      value = checkPkgs.writeText name (
        builtins.deepSeq (sanitize (builtins.removeAttrs evaluated.config [ "_module" ])) "ok\n"
      );
    };

  entries = lib.concatMap (
    module:
    lib.optional (builtins.pathExists (module.path + "/home.nix")) (
      evalCheck "home" "x86_64-linux" module
    )
    ++ lib.optional (builtins.pathExists (module.path + "/home.nix")) (
      evalCheck "home" "aarch64-darwin" module
    )
    ++ lib.optional (builtins.pathExists (module.path + "/system.nix")) (
      evalCheck "system" "x86_64-linux" module
    )
    ++ lib.optional (builtins.pathExists (module.path + "/droid.nix")) (
      evalCheck "droid" "aarch64-linux" module
    )
  ) modules;
in
builtins.listToAttrs entries
