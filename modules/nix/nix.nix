{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;
      nix = {
        package = pkgs.nix;

        settings = {
          experimental-features = [
            "flakes"
            "nix-command"
          ];
        };
      };
    };
}
