{ self, ... }:
{
  flake.modules.nixos.kitty = {
    home-manager.sharedModules = [
      self.modules.homeManager.kitty
    ];
  };
  flake.modules.homeManager.kitty = {
    programs = {
      kitty = {
        enableGitIntegration = true;
        enable = true;
        extraConfig = ''
          include kitty-colors.conf
        '';
        settings = {
          font_family = "SFMono Semi Bold Nerd";
          confirm_os_window_close = 0;
          transparency = "0.9";
          enable_audio_bell = "none";
          cursor_trail = "1";
          cursor_trail_decay = "0.075 0.175";
          cursor_trail_start_threshold = "0";
          disable_ligatures = "never";
          hide_window_decorations = "no";
        };
      };
    };
  };
}
