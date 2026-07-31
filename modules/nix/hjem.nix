#WIP
{
  inputs,
  ...
}:
let
  hjemConfig = { ... }: {
  };
in
{
  flake.modules.nixos.hjem = {
    imports = [
      inputs.hjem.nixosModules.default
      hjemConfig
    ];

  };
  flake.modules.darwin.hjem = {
    imports = [
      inputs.hjem.darwinModules.default
      hjemConfig
    ];

  };

}
