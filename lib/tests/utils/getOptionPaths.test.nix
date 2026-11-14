{ lib, localLib }:
let
  options = {
    _module = {
      check = {
        _type = "option";
      };
    };
    desktop.xdg = {
      enable = {
        _type = "option";
      };
      browser = {
        _type = "option";
      };
    };
    programs.foo = {
      enable = {
        _type = "option";
      };
      nested.bar = {
        _type = "option";
      };
    };
  };
in
{
  "test utils.getOptionPaths: should collect option paths and ignore _module" = {
    expr = localLib.utils.getOptionPaths options;

    expected = [
      [
        "desktop"
        "xdg"
        "browser"
      ]
      [
        "desktop"
        "xdg"
        "enable"
      ]
      [
        "programs"
        "foo"
        "enable"
      ]
      [
        "programs"
        "foo"
        "nested"
        "bar"
      ]
    ];
  };

  "test utils.getOptionPaths: should return an empty list for empty options" = {
    expr = localLib.utils.getOptionPaths { };

    expected = [ ];
  };
}
