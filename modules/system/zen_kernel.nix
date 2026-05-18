{ inputs, ... }:
{
  flake.modules.nixos.zen_kernel =
    { pkgs, ... }:
    {
      boot.kernelPackages = pkgs.linuxPackages_zen;
      boot.kernelModules = [ "hid_xpadneo" ];
    };
}
