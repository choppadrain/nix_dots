{ inputs, self, ... }:
{
  flake.modules.home.yazi =
    {
      lib,
      wlib,
      config,
      pkgs,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.yazi ];

      options.initLua = lib.mkOption {
        type = lib.types.lines;
        default = "";
        description = "init.lua contents";
      };

      config = {

        constructFiles.initLua = {
          content = config.initLua;
          relPath = "${config.binName}-config/init.lua";
        };

        initLua = ''

          require("full-border"):setup {
          type = ui.Border.PLAIN,
          }

          require("starship"):setup()

          require("relative-motions"):setup({ show_numbers="relative", show_motion = true, only_motions = true, enter_mode ="first" })
        '';

        settings = {
        };

        plugins = (
          with pkgs.yaziPlugins;
          {
            full-border = full-border;
            relative-motions = relative-motions;
            git = git;
            jump-to-char = jump-to-char;
            clipboard = clipboard;
            smart-enter = smart-enter;
            starship = starship;
          }
          // {
            fuzzy-search = inputs.fuzzy-search;
          }
        );
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.yazi = inputs.wrappers.wrappers.yazi.wrap {
        imports = [ self.modules.home.yazi ];
        inherit pkgs;
      };
    };
}
