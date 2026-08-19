{ ... }:
{
  osama.modules.desktop =
    { pkgs, ... }:
    let
      riftwm = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        pname = "rift-wm";
        version = "unstable";

        __structuredAttrs = true;

        src = pkgs.fetchFromGitHub {
          owner = "acsandmann";
          repo = "rift";
          rev = "main";
          hash = "sha256-n/hdVX7XLp2FR4US+YDQWW0gMtBbRveEpRdcm2/ac6U=";
        };

        buildInputs = [
          pkgs.apple-sdk
        ];
        doCheck = false;

        cargoHash = "sha256-wxymypJjczFqI9oivnVX/TOnR1KuupsaryQIQQVN7Gs=";
      });
    in
    {
      environment.systemPackages = [
        riftwm
      ];
    };
}
