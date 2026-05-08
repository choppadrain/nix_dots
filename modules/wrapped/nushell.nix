{
  inputs,
  self,
  ...
}:
{
  flake.nushellWraped =
    {
      pkgs,
      lib,
      wlib,
    }:
    {
      imports = [ wlib.wrapperModules.nushell ];

      config = {
        "config.nu" = ''
           $env.config = {
              show_banner: false
              edit_mode: vi

              keybindings: [
                  {
                      name: normal_j
                      modifier: none
                      keycode: char_j
                      mode: vi_normal
                      event: { edit: NextHistory }
                  }
                  {
                      name: normal_k
                      modifier: none
                      keycode: char_k
                      mode: vi_normal
                      event: { edit: PreviousHistory }
                  }
              ]
          }         
        '';
        "env.nu" = ''

        '';
      };
      extraPackages = [
      ];
    };

  perSystem =
    { ... }:
    {

    };
}
