{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      with self.modules.nixos;
      [
        vm
        desktop
        choppadrain
        fonts
        homeManager
        nixos
        amdgpu
        base
        themeSwitcher
        utils
        tmux
        zen_kernel
      ]
      ++ [
        {
          home-manager.users.choppadrain = {
            imports = with self.modules.homeManager; [
              base16
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
  flake.modules.nixos.nixos =
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

      xdg.portal = {
        enable = true;
        #   wlr.enable = true;
        #
        #   wlr.settings.screencast = {
        #     chooser_type = "simple";
        #     chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        #   };
        #   config = {
        #     # common = {
        #     #   default = [
        #     #     "wlr"
        #     #     "gtk"
        #     #   ];
        #     # };
        #
        #   };
      };
      xdg.portal.extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];

      networking.hostName = "nixos"; # Define your hostname.

      networking.networkmanager.enable = true;

      time.timeZone = "Europe/Chisinau";

      i18n.defaultLocale = "en_US.UTF-8";

      programs.steam.enable = true;

      environment.systemPackages = with pkgs; [
        telegram-desktop
        vesktop
        steam
        inputs.self.packages.${pkgs.system}.neovim
        prismlauncher
        jdk25_headless
        typst
        inputs.helium.packages.${system}.default
        zathura
        anki
        gamemode
        inputs.self.packages.${pkgs.system}.yazi
        inputs.self.packages.${pkgs.system}.zsh
        inputs.self.packages.${pkgs.system}.starship
      ];
      system.stateVersion = "25.05"; # Did you read the comment?
    };
}
