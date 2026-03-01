{inputs, ...}:{
flake.nixosModules.desktop = {pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = ["hid_xpadneo"];
 };
}
