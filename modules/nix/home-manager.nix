{
  inputs,
  ...
}:
let
  home-manager-config =
    { lib, ... }:
    {
      home-manager = {
        verbose = true;
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        overwriteBackup = true;
      };
    };
in
{
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.flakeModules.home-manager
      home-manager-config
    ];
    programs.home-manager.enable = true;
  };

}
