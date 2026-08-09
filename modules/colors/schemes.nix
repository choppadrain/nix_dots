{ inputs, ... }:
{
  osama.core = { config, ... }: {
    themes = {
      dark = {
        slug = "vague";
        scheme = "Vague";
        author = "mollypostmark";

        # Backgrounds
        base00 = "#141415"; # Default background
        base01 = "#1c1c24"; # Lighter background
        base02 = "#252530"; # Selection background
        base03 = "#606079"; # Comments, invisibles

        # Foregrounds
        base04 = "#878787"; # Dark foreground
        base05 = "#cdcdcd"; # Default foreground
        base06 = "#aeaed1"; # Light foreground
        base07 = "#d7d7d7"; # Lightest foreground

        # Accents
        base08 = "#d8647e"; # Red
        base09 = "#e08398"; # Orange
        base0A = "#f3be7c"; # Yellow
        base0B = "#7fa563"; # Green
        base0C = "#99b782"; # Cyan
        base0D = "#6e94b2"; # Blue
        base0E = "#bb9dbd"; # Mauve
        base0F = "#c9b1ca"; # Lavender

        # Extended
        base10 = "#141415"; # Darker background
        base11 = "#1c1c24"; # Darkest background
        base12 = "#e08398"; # Bright red
        base13 = "#f5cb96"; # Bright yellow
        base14 = "#99b782"; # Bright green
        base15 = "#bebeda"; # Bright cyan
        base16 = "#8ba9c1"; # Bright blue
        base17 = "#c9b1ca"; # Bright magenta
      };

      light = {
      };
    };

  };

}
