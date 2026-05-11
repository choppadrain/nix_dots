{ inputs, ... }:
{
  flake.nixosModules.base16 =
    { ... }:
    {
      imports = [
        inputs.base16.nixosModule
      ];
      config.scheme = "${inputs.tt-schemes}/base16/vague.yaml";
    };
}
