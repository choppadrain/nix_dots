{ self, inputs, ... }: {
  flake.modules.nixos.desktop = {
    programs.hyprland.enable = true;

    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    home-manager.sharedModules = [
      self.modules.homeManager.hyprland
    ];

  };

  flake.modules.homeManager.hyprland = { pkgs, ... }: {
    home = {
      pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 21;
      };
      packages = with pkgs; [
        wl-clipboard
        wofi
        grim
        slurp
        awww

      ];
    };
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      xwayland.enable = true;

      plugins = with pkgs; [ hyprlandPlugins.hy3 ];

      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      extraLuaFiles = {
        "keybinds" = {
          content = builtins.readFile ./keybinds.lua;
          autoLoad = true;
        };

        "windowrules" = {
          content = builtins.readFile ./windowrules.lua;
          autoLoad = true;
        };
        "hy3" = {
          content = builtins.readFile ./hy3.lua;
          autoLoad = true;
        };
        "general" = {
          content = builtins.readFile ./general.lua;
          autoLoad = true;
        };
      };
    };
  };
}
