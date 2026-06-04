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
                on = "f";
                run = "filter --smart";
                desc = "Filteer files smart way";
                }
                ];
            };
            };
        };       
    };
 };
 }
