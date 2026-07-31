{ ... }:
let
  nixpkgsCommon = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nix;

      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
        ];
      };
    };
  };
in
{
  flake.modules.nixos.base = {
    imports = [ nixpkgsCommon ];
  };
  flake.modules.darwin.base = {
    imports = [ nixpkgsCommon ];
  };
}
