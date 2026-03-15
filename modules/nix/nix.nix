{
  flake.nixosModules.base =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;
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
    };
}
