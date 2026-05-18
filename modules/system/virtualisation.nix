{self,...}:{
  flake.modules.nixos.vm = {pkgs, ...}:{
    home-manager.sharedModules = [
        self.modules.homeManager.vm
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
    flake.modules.homeManager.vm = {...}:{
        dconf.settings = {
              "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
        };
    };
}
