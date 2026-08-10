{ inputs, config, ... }: {
  osama.modules.nh =
    {
      constants,
      wlib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.nh ];
      config = {
        flake = "${constants.homeDir}/nix_dots";
      };
    };
  perSystem = { pkgs, ... }: {
    packages.nh = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      imports = [ config.osama.modules.nh ];
    };
  };
}
