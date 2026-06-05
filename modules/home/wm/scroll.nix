{inputs,...}:{
    flake.modules.nixos.scroll = {pkgs,...}:{
        imports = [inputs.scroll-flake.nixosModules.default];
        programs.scroll = { 
        enable = true;
        extraSessionCommands = ''
      # Tell QT, GDK and others to use the Wayland backend by default, X11 if not available
      export QT_QPA_PLATFORM="wayland;xcb"
      export GDK_BACKEND="wayland,x11"
      export SDL_VIDEODRIVER=wayland
      export CLUTTER_BACKEND=wayland

      # XDG desktop variables to set scroll as the desktop
      export XDG_CURRENT_DESKTOP=scroll
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=scroll

      # Configure Electron to use Wayland instead of X11
      export ELECTRON_OZONE_PLATFORM_HINT=wayland
    '';
    };
    };
}
