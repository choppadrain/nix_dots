{...}: {
    flake.waybarWrapped = {wlib, pkgs, ...}:{
        imports = [ wlib.wrapperModules.waybar];
        config = {
            settints = {
                
            };

            "style.css".content = ''
                
            '';
        };
    };
    perSystem = {pkgs, ...}:{
    };

}
