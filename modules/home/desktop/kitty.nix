{ self, ... }:
{
  flake.modules.nixos.desktop = {
    home-manager.sharedModules = [
      self.modules.homeManager.kitty
    ];
  };
  flake.modules.homeManager.kitty =
    { scheme, ... }:
    let
      s = scheme;
    in
    {
      programs = {
        kitty = {
          enableGitIntegration = true;
          enable = true;
          extraConfig = ''
            foreground               ${s.base05}
            background               ${s.base00}
            selection_foreground     ${s.base05}

            selection_background     ${s.base02}
            cursor                   none
            url_color                ${s.base0E}

            active_border_color ${s.base04}
            inactive_border_color ${s.base02}

            color0   ${s.base02}
            color8   ${s.base03}
            color1   ${s.base08}
            color9   ${s.base09}
            color2   ${s.base0B}
            color10  ${s.base0C}
            color3   ${s.base0A}
            color11  ${s.base13}
            color4   ${s.base0D}
            color12  ${s.base16}
            color5   ${s.base0E}
            color13  ${s.base0F}
            color6   ${s.base06}
            color14  ${s.base15}
            color7   ${s.base05}
            color15  ${s.base07}

            active_tab_foreground    ${s.base05}
            active_tab_background    ${s.base02}
            inactive_tab_foreground  ${s.base03}
            inactive_tab_background  ${s.base00}
          '';
          settings = {
            font_family = "SFMono Semi Bold Nerd";
            font_size = "11.5";
            confirm_os_window_close = 0;
            transparency = "1.0";
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
