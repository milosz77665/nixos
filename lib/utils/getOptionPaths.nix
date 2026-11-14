{ lib }:
options:
let
  walk =
    prefix: attrs:
    lib.concatLists (
      lib.mapAttrsToList (
        name: value:
        if (value ? _type) && value._type == "option" then
          [ (prefix ++ [ name ]) ]
        else if builtins.isAttrs value then
          walk (prefix ++ [ name ]) value
        else
          [ ]
      ) attrs
    );

  paths = walk [ ] options;
in
builtins.filter (path: builtins.head path != "_module") paths
