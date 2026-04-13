#default.nix
{
  inputs,
  self,
  lib,
  pkgs,
  ...
}:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      with self.nixosModules;
      [
        choppadrain
        fonts
        nushell
        homeManager
        nixosModule
        pipewire
        amdgpu
        hyprland
        waybar
        base
        themeSwitcher
        utils
        yazi
        kitty
        tmux
      ]
      ++ [
        {
          home-manager.users.choppadrain = {
            imports = with self.homeModules; [
            ];
            home.stateVersion = "25.05";
            home.sessionVariables = {
              EDITOR = "nvim";
              VISUAL = "nvim";
            };
          };
        }
      ];

  };
  flake.nixosModules.nixosModule =
    { pkgs, ... }:
    {
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

      environment.systemPackages = with pkgs; [
        vim
        telegram-desktop
        vesktop
        steam
        inputs.self.packages.${pkgs.system}.neovim
        prismlauncher
        jdk25_headless
        typst
        inputs.helium.packages.${system}.default
        zathura
        libreoffice
      ];
      system.stateVersion = "25.05"; # Did you read the comment?
    };
}
