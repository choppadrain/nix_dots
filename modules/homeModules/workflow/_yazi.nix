{pkgs, ...}: {
  programs = {
    yazi = {
      enable = true;
      package = pkgs.yazi;
      
      plugins = {
        inherit
          (pkgs.yaziPlugins)
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
}
