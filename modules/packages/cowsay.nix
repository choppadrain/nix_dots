{ inputs, config, ... }: {
  osama.modules.terminal = { pkgs, ... }: {
    custom.cowsay = {
      package = pkgs.cowsay;
    };

    hj.packages = [
      (inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [
          config.custom.cowsay
        ];
      })
    ];
  };
}
