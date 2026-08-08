{
  config,
  self,
  pkgs,
  ...
}:
{
  macbookTest = {
    user = "choppadrain";
    platform = "darwin";
    system = "aarch64-darwin";
    stateVersion = 6;
    # theme = "dark";
    modules = with self.modules.darwin; [
      base
    ];

    extraConfig = {
      system.primaryUser = "choppadrain";
      environment.systemPackages = with pkgs; [
        inputs.self.packages.${pkgs.system}.yazi
        anki-bin
        vesktop
        go
        inputs.self.packages.${pkgs.system}.zsh
        inputs.self.packages.${pkgs.system}.starship
        inputs.self.packages.${pkgs.system}.neovim
        inputs.self.packages.${pkgs.system}.neovimImpure
        inputs.self.packages.${pkgs.system}.ghostty
        inputs.self.packages.${pkgs.system}.tmux
        inputs.self.packages.${pkgs.system}.nh
        prismlauncher
        jdk25
      ];
      nixpkgsHostplatform = "aarch64-darwin";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      users.users.choppadrain = {
        name = "choppadrain";
        home = "/Users/choppadrain";
      };
    };
  };
}
