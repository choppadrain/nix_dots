{
  flake.nixosModules.grub =
    { ... }:
    {
      boot.loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        grub = {
          configurationLimit = 10;
          enable = true;
          efiSupport = true;
          device = "nodev";
          useOSProber = true;
        };
      };
    };
}
