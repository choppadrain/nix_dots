{
  inputs,
  ...
}:

{

  osama.common =
    {
      constants,
      lib,
      ...
    }:
    {
      imports = [
        (
          if constants.platform == "darwin" then
            inputs.hjem.darwinModules.default
          else
            inputs.hjem.nixosModules.default
        )
        (lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" constants.username ])
      ];

      hjem.clobberByDefault = true;

      hj = {
        enable = true;

        user = constants.username;
        directory = constants.homeDir;

      };

    };
}
