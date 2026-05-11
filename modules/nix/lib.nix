{
  inputs,
  lib,
  pkgs,
  ...
}:
{

  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = { };
  };

  config.flake.lib = {
    mkMyPkg = name: {
      nixpkgs.overlays = [
        (final: prev: {
          "${name}" = inputs.self.packages.${pkgs.system}.${name};
        })
      ];

    };
  };
}
