{ inputs, ... }:
{
  perSystem =
    { pkgs, scheme, ... }:
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
              client.focused          ${scheme.base08} ${scheme.base08} ${scheme.base05} ${scheme.base0D} ${scheme.base08}
              client.focused_inactive ${scheme.base01} ${scheme.base01} ${scheme.base05} ${scheme.base03} ${scheme.base01}
              client.unfocused        ${scheme.base00} ${scheme.base00} ${scheme.base04} ${scheme.base01} ${scheme.base00}
              client.urgent           ${scheme.base08} ${scheme.base08} ${scheme.base05} ${scheme.base08} ${scheme.base08}
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
