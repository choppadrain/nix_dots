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
                prepend_keymap = [{
                    on = "f";
                    run  = "plugin jump-to-char";
                    desc = "Jump to char";  
                }

                {
                on = "F";
                run = "filter --smart";
                desc = "Filteer files smart way";
                }

                # fuck nushell its currently does not work until i switch to zsh
                # {
                # on = "z";   
                # run = "plugin fuzzy-search -- fd --TL=3";
                # desc = "fuzzy find";
                # }
                #
                # {
                # on = "<S-s>";
                # run = "plugin fuzzy-search --rg --TL=3";
                # desc = "rg search";
                # }
                #
                # {
                # on = "<S-z>";
                # run = "plugin fuzzy-search -- zoxide --TL=3";
                # desc = "zoxide search";
                # }

                ];
            };
            };
        };       
    };
 };
 }
