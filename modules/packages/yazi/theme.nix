{ scheme, ... }:
{
  flake.modules.homeManager.yazi =
    { ... }:
    {
      config.settings.theme = {
        status = {
          sep_left = {
            open = "█";
            close = "█";
          };
          sep_right = {
            open = "█";
            close = "█";
          };
        };

        indicator = {
          padding = {
            open = "█";
            close = "█";
          };
        };
        icon = {
          globs = [ ];
          dirs = [
            {
              name = ".config";
              text = "";
              fg = "${scheme.base0D}";
            }
            # { name = ".git"; text = ""; fg = "${base0D}"; }
            # { name = ".github"; text = ""; fg = "${base0D}"; }
            # { name = ".npm"; text = ""; fg = "${base0D}"; }
            # { name = "Desktop"; text = ""; fg = "${base0D}"; }
            # { name = "Development"; text = ""; fg = "${base0B}"; } # Mapped to Green
            # { name = "Documents"; text = ""; fg = "${base0D}"; }
            # { name = "Downloads"; text = ""; fg = "${base0D}"; }
            # { name = "NixOS"; text = ""; fg = "${base0C}"; } # Mapped to Cyan
            # { name = "Library"; text = ""; fg = "${base0D}"; }
            # { name = "Movies"; text = ""; fg = "${base0D}"; }
            # { name = "Music"; text = ""; fg = "${base0D}"; }
            # { name = "Pictures"; text = ""; fg = "${base0D}"; }
            # { name = "Public"; text = ""; fg = "${base0D}"; }
            # { name = "Videos"; text = ""; fg = "${base0D}"; }
          ];
        };
      };

    };
}
