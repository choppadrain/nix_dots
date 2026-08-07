{ inputs, ... }: {
  flake.modules.homeManager.ghostty = { pkgs, lib, ... }: {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        command = "${lib.getExe inputs.self.packages.${pkgs.system}.zsh}";
        font-family = "SF Mono";
        font-size = 15;
        theme = "vague";
      };

    };
  };
}
