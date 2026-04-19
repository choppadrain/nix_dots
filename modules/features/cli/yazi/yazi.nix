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
          settings = {
            yazi = {

            };
            theme = {

            };
            keymap = {
              manager.prepend_keymap = [
                {
                  on = [ "e" ];
                  run = "plugin jump-to-char";
                }
              ];

            };
          };

          plugins = {
            inherit (pkgs.yaziPlugins)
              full-border
              chmod
              git
              jump-to-char
              rich-preview
              wl-clipboard
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
