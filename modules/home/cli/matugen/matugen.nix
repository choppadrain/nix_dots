{ self, ... }:
{
  #want to get rid of this shit with base16 so much
  flake.modules.nixos.themeSwitcher = {
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
          command = "awww"
          arguments = ["img", "--transition-type", "center"]

          [templates.gtk3]
          input_path = '${templatePath}/gtk-colors.css'
          output_path = '~/.config/gtk-3.0/gtk-colors.css'


          [templates.gtk4]
          input_path = '${templatePath}/gtk-colors.css'
          output_path = '~/.config/gtk-4.0/gtk-colors.css'


          [templates.vesktop]
          input_path = '${templatePath}/midnight-discord.css'
          output_path = '~/.config/vesktop/themes/midnight-discord.css'






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
