{ inputs, ... }:
{
  flake.modules.nixos.base16 =

    { config, ... }:

    {
      imports = [
        inputs.base16.nixosModule
      ];
      scheme = "${inputs.tt-schemes}/base16/nord.yaml";

      _module.args = {inherit (config) scheme; };
    };
}
