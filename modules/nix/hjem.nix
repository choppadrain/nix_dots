{
  inputs,
  ...
}:

{

  osama.core =
    {
      constants,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        (
          if pkgs.stdenv.isDarwin then
            "inputs.hjem.darwinModules.default"
          else
            "inputs.hjem.nixosModules.default"
        )
        inputs.hjem.nixosModules.default
        (lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" constants.username ])
      ];

      hjem.clobberByDefault = true;

      hj = {
        enable = true;

        user = constants.username;
        directory = constants.homedir;

      };

    };
}
