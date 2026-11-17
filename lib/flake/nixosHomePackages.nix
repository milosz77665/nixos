self: hostName:
let
  users = self.nixosConfigurations.${hostName}.config.home-manager.users;
in
self.nixosConfigurations.${hostName}.config.home-manager.users.${builtins.head (builtins.attrNames users)}.home.packages
