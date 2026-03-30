{ self, ... }:
{
  flake.nixosModules.yazi = {
    home-manager.sharedModules = [
      self.homeModules.yazi
    ];
  };
  flake.homeModules.yazi =
    { pkgs, ... }:
    {
      programs = {
        yazi = {
          enable = true;
          package = pkgs.yazi;

          plugins = {
            inherit (pkgs.yaziPlugins)
              full-border
              ;
          };
          initLua = ''
            require("full-border"):setup {
             type = ui.Border.ROUNDED,
                }

          '';
        };
      };
    };
}
