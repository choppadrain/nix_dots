{ self, ... }:
{
  flake.nixosModules.themeSwitcher = {
    home-manager.sharedModules = with self.homeModules; [
      matugen
    ];
  };
  flake.homeModules.matugen =
    { pkgs, ... }:
    let
      templatePath = "~/.config/matugen/templates";
    in
    {
      home.packages = with pkgs; [
        matugen
      ];
      xdg.configFile = {
        "matugen/config.toml".text = ''
          [config]
          variant = "dark"
          jsonFormat = "hex"

          [config.wallpaper]
          command = "swww"
          arguments = ["img", "--transition-type", "center"]

          [templates.gtk3]
          input_path = '${templatePath}/gtk-colors.css'
          output_path = '~/.config/gtk-3.0/gtk-colors.css'


          [templates.gtk4]
          input_path = '${templatePath}/gtk-colors.css'
          output_path = '~/.config/gtk-4.0/gtk-colors.css'

          [templates.kitty]
          input_path = "${templatePath}/kitty-colors.conf"
          output_path = "~/.config/kitty/kitty-colors.conf"
          post_hook = "pkill -USR1 kitty"

          [templates.vesktop]
          input_path = '${templatePath}/midnight-discord.css'
          output_path = '~/.config/vesktop/themes/midnight-discord.css'

          [templates.telegram]
          input_path = "${templatePath}/Matugen.tdesktop-theme"
          output_path = "~/.local/share/TelegramDesktop/tdata/themes/Matugen.tdesktop-theme"

          [templates.old-telegram]
          input_path = "${templatePath}/old-telegram.tdesktop-theme"
          output_path = "~/.local/share/TelegramDesktop/tdata/themes/telegram.tdesktop-theme"



        '';
        "matugen/templates".source = ./templates;
      };

      gtk = {
        enable = true;
        gtk3.extraCss = "@import url(\"gtk-colors.css\");";
        gtk4.extraCss = "@import url(\"gtk-colors.css\");";
      };
    };

}
