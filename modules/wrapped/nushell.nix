{
inputs,
self,
...
}:{
    flake.nushellWraped = {
        pkgs,
        lib,
        wlib
    }:{
        imports = [wlib.wrapperModules.nushell];
        config = {
            "config.nu" = '''';
            "env.nu" = {};
        };
    };
}
