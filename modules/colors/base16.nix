{ inputs, ... }:
let
    scheme = {
    slug = "vague";
    scheme = "Vague";
    author = "mollypostmark";

    # Backgrounds
    base00 = "#252530"; # Default background
    base01 = "#1c1c24"; # Lighter background
    base02 = "#333738"; # Selection background
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
    base12 = "#333738"; # Bright red
    base13 = "#878787"; # Bright yellow
    base14 = "#e8b589"; # Bright green
    base15 = "#e0a363"; # Bright cyan
    base16 = "#c48282"; # Bright blue
    base17 = "#405065"; # Bright magenta
};
in
{

  perSystem =
    { pkgs, lib, ... }:
    let
      base16lib = inputs.base16.lib { inherit pkgs lib; };
      finalScheme = base16lib.mkSchemeAttrs scheme;
    in
    {
      _module.args = {
        scheme = finalScheme;
      };
    };

  flake.modules.nixos.default = {
    imports = [ inputs.base16.nixosModule ];

    _module.args = {
      inherit scheme;
    };
  };
}

