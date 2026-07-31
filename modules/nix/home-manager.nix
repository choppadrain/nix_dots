{
  inputs,
  pkgs,
  ...
}:
let
  hmConfig = { ... }: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      overwriteBackup = true;
    };
  };
in
{
  flake.modules.nixos.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      hmConfig
    ];

  };
  flake.modules.darwin.homeManager = {
    imports = [
      inputs.home-manager.darwinModules.home-manager
      hmConfig
    ];

  };

}
