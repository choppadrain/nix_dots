{ inputs, ... }:
{
  flake.modules.nixos.base16 =

    { ... }: 

    {
      imports = [
        inputs.base16.nixosModule
      ];
      config.scheme = "${inputs.tt-schemes}/base16/nord.yaml";
    };
}
