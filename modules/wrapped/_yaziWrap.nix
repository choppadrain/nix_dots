{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.myYazi = inputs.wrapper-modules.wrappers.yazi.wrap {
        # Настройки самого Yazi (внутри блока settings)
        settings = {
          yazi = {
          };
        };
        plugins = { };

      };
    };
}
