{ inputs, ... }:
{
  perSystem =
    { pkgs, scheme,  ... }:
    let
      swayPatched = pkgs.sway-unwrapped.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          (pkgs.fetchpatch {
            url = "https://gist.githubusercontent.com/bim9262/0f63e6b5d8107d7d2654b61e0b7debe2/raw";
            hash = "sha256-+6II1Xnth/uenTeCnOUSDgsjpRgfW3ilRp+nMjs1eJg";
          })
        ];
      });

      swayWrapped =
        {
          lib,
          wlib,
          config,
          ...
        }:
        {
          imports = [ wlib.modules.default ];

          options.settings = lib.mkOption {
            type = lib.types.str;
            default = "";
            description = "swayconfig";
          };

          options.extraConfig = lib.mkOption {
            type = lib.types.str;
            default = "";
            description = "extraconf";
          };

          config = {
            package = swayPatched;
            flags."-c" = "${config.constructFiles.settings.path}";

            runtimePkgs = with pkgs; [
              slurp
              grim
              xdg-desktop-portal
              xdg-desktop-portal-gtk
              xdg-desktop-portal-wlr
              xdg-desktop-portal-gnome
              wl-clipboard
              mako
              gamescope
              awww
              polkit_gnome
            ];

            env = {
              QT_QPA_PLATFORM = "wayland:xcb";
              NIXOS_OZONE_WL = "1";
              XDG_SESSION_TYPE = "wayland";
              XDG_CURRENT_DESKTOP = "sway";
              SDL_VIDEODRIVER = "wayland";
            };

            extraConfig = ''

                ${scheme.base00}
              client.focused_inactive #2d5a27 #051405 #a3be8c #2d5a27     #2d5a27
              client.unfocused        #132a13 #051405 #4f772d #132a13     #132a13
              client.urgent           #6a040f #6a040f #ffffff #FF00FF     #6a040f
            '';

            settings = builtins.readFile ./config.in;

            constructFiles.settings = {
              content = config.settings + "\n" + config.extraConfig;
              relPath = "etc/sway/config";
            };
          };

        };
    in
    {
      packages.sway = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ swayWrapped ];
      };
    };
}
