{ inputs, ... }:
let
  nixpkgsCommon = { pkgs, ... }: {
    nixpkgs.overlays = [ inputs.nix-orion.overlays.default ];
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nix;

      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
          "pipe-operators"
        ];
      };
    };
  };
in
{
  osama.common = {
    imports = [ nixpkgsCommon ];
  };
}
