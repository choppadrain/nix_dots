{ inputs, ... }:
{
  flake.nixosModules.zen_kernel =
    { pkgs, ... }:
    {
      boot.kernelPackages = pkgs.linuxPackages_zen;
      boot.kernelModules = [ "hid_xpadneo" ];
    };
}
