{ inputs, ... }:
let
  ghosttyWrapped =
    {
      lib,
      pkgs,
      wlib,
      config,
      ...
    }:
    {
      imports = [ wlib.modules.default ];
      options.settings = lib.mkOption {
        type = lib.types.lines;
        default = " ";
        description = "main config";
      };
      config = {
        package = lib.mkDefault (if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty);
        addFlag = [
          "--config-default-files=false"
          "--config-file=${config.constructFiles."config".path}"
        ];
        constructFiles."config" = {
          content = config.settings;
          relPath = "config";

        };
        settings = ''
          theme = vague
          font-family = SF Mono
          font-size = 15
          command = ${lib.getExe inputs.self.packages.${pkgs.system}.zsh}

        '';
        #copied from this #https://github.com/BirdeeHub/nix-wrapper-modules/pull/546/changes/8dea37e1d510ee3687af092e6d08db385001551d
        argv0type =
          let
            binPath = lib.escapeShellArg config.wrapperPaths.input;
          in
          cmd: ''
            for _ghostty_arg in "$@"; doExpand commentComment on line R98Resolved
              case "$_ghostty_arg" in
                +*|--help) exec -a "$0" ${binPath} "$@";;
              esac
            done
            exec -a "$0" ${cmd}
          '';
      };
    };
in
{

  perSystem =
    { pkgs, ... }:
    {
      packages.ghostty = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ ghosttyWrapped ];
      };
    };
}
