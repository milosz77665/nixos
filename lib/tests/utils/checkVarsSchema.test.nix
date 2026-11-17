{ lib, localLib }:
let
  validVars = {
    user = {
      name = "alice";
      fullName = "Alice Smith";
    };
    homeStateVersion = "25.11";
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

  "test utils.checkVarsSchema: should accept systemStateVersion when required" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        systemStateVersion = "24.05";
      };
      requireSystemStateVersion = true;
    };

    expected = [ ];
  };

  "test utils.checkVarsSchema: should report missing systemStateVersion when required" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars;
      requireSystemStateVersion = true;
    };

    expected = [ "missing systemStateVersion" ];
  };

  "test utils.checkVarsSchema: should report invalid systemStateVersion" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        systemStateVersion = "24";
      };
    };

    expected = [ "systemStateVersion must look like 25.11" ];
  };

  "test utils.checkVarsSchema: should report non-string systemStateVersion" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        systemStateVersion = 2405;
      };
    };

    expected = [ "systemStateVersion is not a string" ];
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

  "test utils.checkVarsSchema: should report invalid homeStateVersion and homeDirectory" = {
    expr = localLib.utils.checkVarsSchema {
      vars = validVars // {
        homeStateVersion = "25";
        homeDirectory = "home/alice";
      };
    };

    expected = [
      "homeStateVersion must look like 25.11"
      "homeDirectory must be an absolute path"
    ];
  };
}
