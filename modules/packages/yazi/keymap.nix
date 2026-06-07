{ ... }:
{
  flake.modules.home.yazi =
    {
      ...
    }:
    {
      config = {
        settings = {
          keymap = {
            mgr = {
              prepend_keymap = [
                {
                  on = "f";
                  run = "plugin jump-to-char";
                  desc = "Jump to char";
                }

                {
                  on = "F";
                  run = "filter --smart";
                  desc = "Filteer files smart way";
                }
                {
                  on = "<Enter>";
                  run = "plugin smart-enter";
                  desc = "smart enter plugin";
                }

                {
                  on = "<C-p>";
                  run = "plugin clipboard -- --action-paste";
                  desc = "paste from system clipboard";
                }

                {
                  on = "y";
                  run = [
                    "yank"
                    "plugin clipboard -- --action=copy"
                  ];

                }

                # fuck nushell its currently does not work until i switch to zsh

                {
                  on = "z";
                  run = "plugin fuzzy-search -- fd --TL=3";
                  desc = "fuzzy find";
                }

                {
                  on = "<S-s>";
                  run = "plugin fuzzy-search --rg --TL=3";
                  desc = "rg search";
                }

                {
                  on = "<S-z>";
                  run = "plugin fuzzy-search -- zoxide --TL=3";
                  desc = "zoxide search";
                }

                #relative motions

                {
                  on = "1";
                  run = "plugin relative-motions 1";
                }

                {
                  on = "2";
                  run = "plugin relative-motions 2";
                }
                {
                  on = "3";
                  run = "plugin relative-motions 3";
                }
                {
                  on = "4";
                  run = "plugin relative-motions 4";
                }
                {
                  on = "5";
                  run = "plugin relative-motions 5";
                }
                {
                  on = "6";
                  run = "plugin relative-motions 6";
                }
                {
                  on = "7";
                  run = "plugin relative-motions 7";
                }
                {
                  on = "8";
                  run = "plugin relative-motions 8";
                }
                {
                  on = "9";
                  run = "plugin relative-motions 9";
                }
              ];
            };
          };
        };
      };
    };
}
