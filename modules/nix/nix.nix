{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;
      nix = {
        package = pkgs.nix;

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };

        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "flakes"
            "nix-command"
          ];
        };
      };
    };
}
