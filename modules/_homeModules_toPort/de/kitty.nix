{
  programs = {
    kitty = {
      enableGitIntegration = true;
      enable = true;
      extraConfig = ''
        include kitty-colors.conf
      '';
      settings = {
        transparency = "0.9";
        cursor_trail = "1";
        cursor_trail_decay = "0.075 0.175";
        cursor_trail_start_threshold = "0";
        disable_ligatures = "never";
        hide_window_decorations = "no";
      };
    };
  };
}
