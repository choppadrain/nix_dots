{ lib, ... }:
{
  flake.module.nixos.fonts =
    {
      pkgs,
      ...
    }:
    let

      apple-emoji = pkgs.stdenv.mkDerivation {
        pname = "apple-emoji";
        version = "latest";
        src = pkgs.fetchurl {
          url = "https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji-Linux.ttf";
          sha256 = "sha256-U1oEOvBHBtJEcQWeZHRb/IDWYXraLuo0NdxWINwPUxg=";
        };

        dontUnpack = true;
        dontBuild = true;
        dontConfigure = true;

        installPhase = "install -D -m644 $src $out/share/fonts/truetype/AppleColorEmoji-Linux.ttf";

        meta = {
          homepage = "https://github.com/samuelngs/apple-emoji-linux";
          description = "Apple Color Emoji for Linux";
          license = lib.licenses.asl20;
        };
      };
    in
    {
      fonts.packages = [ apple-emoji ];
    };
}
