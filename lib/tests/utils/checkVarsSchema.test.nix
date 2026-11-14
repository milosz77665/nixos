{ lib, localLib }:
let
  validVars = {
    user = {
      name = "alice";
      fullName = "Alice Smith";
    };
    stateVersion = "25.11";
    homeDirectory = "/home/alice";
    git = {
      username = "alice";
      email = "alice@example.com";
    };
  };
in
{
  "test utils.checkVarsSchema: should accept valid vars" = {
    expr = localLib.utils.checkVarsSchema { vars = validVars; };

    expected = [ ];
  };

  "test utils.checkVarsSchema: should report missing paths" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        git = {
          username = "alice";
        };
      };
    };

    expected = [ "missing git.email" ];
  };

  "test utils.checkVarsSchema: should report values with wrong types" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        user = {
          name = 1;
          fullName = "Alice Smith";
        };
      };
    };

    expected = [ "user.name is not a string" ];
  };

  "test utils.checkVarsSchema: should report invalid stateVersion and homeDirectory" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        stateVersion = "25";
        homeDirectory = "home/alice";
      };
    };

    expected = [
      "stateVersion must look like 25.11"
      "homeDirectory must be an absolute path"
    ];
  };
}
