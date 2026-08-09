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
          "pipe-operators"
        ];
      };
    };
  };
in
{
  osama.core = {
    imports = [ nixpkgsCommon ];
  };
}
