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
      env.STARSHIP_CONFIG = "$out/starship.toml";
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

  perSystem = { pkgs,self, ... }: {
    packages.starship = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      modules = [ self.starshipWrapped ];
    };
  };
}
