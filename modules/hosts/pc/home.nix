{
  flake.homeConfiguration.choppadrain = home-manager.lib.homeManagerConfiguration {
    modules = [ ];

  };
  flake.homeModules.choppadrainModule =
    {
      pkgs,
      inputs,
      lib,
      ...
    }:
    {

      home.username = "choppadrain";
      home.homeDirectory = lib.mkDefault "/home/choppadrain";
      home.stateVersion = "25.05";

      home.packages = with pkgs; [
        vesktop
        telegram-desktop
        go
        gh
        hyprpolkitagent
        wofi
        btop
        inputs.zen-browser.packages."${system}".twilight
        obsidian
        wget
        qbittorrent
        home-manager
      ];
      home.file = {
      };

      home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      programs.home-manager.enable = true;
    };
}
