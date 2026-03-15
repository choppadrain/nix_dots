{
  flake.nixosModules.amdgpu =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "amdgpu" ];

      #not sure does it work in 2026, but used to be a fix for dead-freeze random crashes look at
      boot.initrd.kernelModules = [ "amdgpu" ];
      boot.kernelParams = [
        "amdgpu.ppfeaturemask=0xffffffff"
        "amdgpu.gfxoff=0"
        "amdgpu.runpm=0"
      ];

      #undervolt
      environment.systemPackages = with pkgs; [ lact ];
      systemd.packages = with pkgs; [ lact ];
      systemd.services.lactd.wantedBy = [ "multi-user.target" ];
    };
}
