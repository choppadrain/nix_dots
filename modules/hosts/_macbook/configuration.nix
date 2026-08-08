{
  self,
  inputs,
  ...
}:
{
  flake.darwinConfigurations.macbook = inputs.nix-darwin.lib.darwinSystem {
    modules = with self.modules.darwin; [
      macbook
      hjem # wip
      choppadrain
      base
    ];
  };

  flake.modules.darwin.macbook = { pkgs, ... }: {
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
    system.configurationRevision = self.rev or self.dirtyRev or null;
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;
    users.users.choppadrain = {
      name = "choppadrain";
      home = "/Users/choppadrain";
    };
  };
}
