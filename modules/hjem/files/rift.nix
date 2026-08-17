{config, ...}:{
    osama.modules.dekstop = {
        environment.systemPackages = with pkgs; [
            rift-wm
        ];
        hj.directory
    };
}
