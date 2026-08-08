{ inputs, ... }:
{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];

  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.wrappers.flakeModules.wrappers
  ];
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.nixfmt-rs;
    };

}
