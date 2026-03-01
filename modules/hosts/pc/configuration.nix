#default.nix
{
  inputs,
  self,
  lib,
  ...
}:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      with self.nixosModules;
      [
        nixosModule
        desktop
        amdgpu
        base
      ]
      ++ [
        {
          home-manager.users.choppadrain = {
            imports = with self.homeModules; [
              hyprland
            ];

            home.stateVersion = "25.05";
            programs.waybar.enable = true;
            home.sessionVariables = {
              EDITOR = "nvim";
              VISUAL = "nvim";
            };

            home.username = "choppadrain";
            home.homeDirectory = lib.mkDefault "/home/choppadrain";
          };
        }
      ];

  };
  flake.nixosModules.nixosModule =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        overwriteBackup = true;
      };

      programs.git.enable = true;

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        SDL_VIDEODRIVER = "wayland";
        XDG_SESSION_TYPE = "wayland";
      };

      environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      xdg.portal.enable = true;
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

      networking.hostName = "nixos"; # Define your hostname.

      networking.networkmanager.enable = true;

      time.timeZone = "Europe/Chisinau";

      i18n.defaultLocale = "en_US.UTF-8";

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        vim
        waybar
        libnotify
        firefox
        fastfetch
        swaynotificationcenter
        wl-clipboard
        grim
        slurp
        os-prober
        telegram-desktop
        vesktop
        ntfs3g
        kdePackages.qt6ct
        kdePackages.dolphin
        libgbm
        fnm
        libreoffice
        hyprpolkitagent
        mesa
        gcc
        cargo
      ];
      nix = {
        package = pkgs.nix;

        settings = {
          substituters = [ "https://hyprland.cachix.org" ];
          trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
          experimental-features = [
            "flakes"
            "nix-command"
          ];
        };
      };
      system.stateVersion = "25.05"; # Did you read the comment?
    };
}
