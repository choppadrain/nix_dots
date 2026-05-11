{self,...}:{
  flake.nixosModules.vm = {pkgs, ...}:{
    home-manager.sharedModules = [
        self.homeModules.dconf
    ];
          programs.dconf.enable = true;
          environment.systemPackages = with pkgs;[
            virt-manager

          ];
          virtualisation = {
            libvirtd = {
                enable = true;
            
            qemu = {
                package = pkgs.qemu_kvm;
                # ovmf.enable = true;
                # ovmf.packages = [pkgs.IVMFFull];
            };
            };
        };
    };
    flake.homeModules.dconf = {...}:{
        dconf.settings = {
              "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
        };
    };
}
