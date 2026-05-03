{ inputs, ... }:
let
  starshipWrapped = { lib, pkgs, wlib, config, ... }: {
    imports = [ wlib.modules.default ];

    options.settings = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "starship.toml";
    };

    config = {
      package = pkgs.starship;
      env.STARSHIP_CONFIG = config.constructFiles.settings.path;
      settings = ''
        add_newline = false;
      '';
      constructFiles.settings = {
        content = config.settings;
        relPath = "starship.toml";
      };
    };
  };
in
{
  flake.starshipWrapped = starshipWrapped;

  perSystem = { pkgs, ... }: {
    packages.starship = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      imports = [ starshipWrapped ];
    };
  };
}
