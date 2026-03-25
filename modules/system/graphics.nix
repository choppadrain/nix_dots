{
  flake.nixosModules.base = {
    hardware = {
      graphics.enable = true;
      graphics.enable32Bit = true;
    };
  };
}
