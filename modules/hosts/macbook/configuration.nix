{
  self,
  inputs,
  nix-darwin,
  ...
}:
{
  flake.darwinConfigurations.mabook = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules =
      with self.modules.darwin;
      [
        macbook
      ]
      ++ [
        {
          home-manager.users.choppadrain = {
            imports = with self.modules.homeManager; [
              starship
              zsh
              yazi
              neovim
              kitty
              tmux
              utils
            ];
          };
        }
      ];

  };
  flake.modules.darwin.macbook = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      inputs.self.packages.${pkgs.system}.yazi
      inputs.self.packages.${pkgs.system}.zsh
      inputs.self.packages.${pkgs.system}.starship

      inputs.self.packages.${pkgs.system}.neovim
      inputs.self.packages.${pkgs.system}.neovimImpure
    ];

  };
}
