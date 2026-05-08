{
  inputs,
  ...
}:
let
  starshipWrapped =
    {
      wlib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.starship ];

        config = {
            settings = {
                add_newline = true;  
                right_format = "";
                format = "$directory(white) $git_branch$git_status";

                directory = {
                    format = "[$path](style)";
                    truncation_length = 2;
                    truncation_symbol = "./";

                };

                time = {
                    
                };
                git_branch = {
                    symbol = "  ";
                    format = "[$symbol$branch](fg:blue italic bold ) ";
                };

                git_status = {
                    format = "[[on](white) $all_status$ahead_behind](fg:red)";
                    ahead = ''[⇡''${count} ](bold cyan)'';
                    diverged = ''[⇕⇡ ''${ahead_count}⇣''${behind_count} ](bold yellow)'';
                    behind = ''[⇣''${count} ](bold red) '';
                    conflicted = "[ ](magenta) ";
                    up_to_date = "[ ](italic white)";
                    untracked = "[? ](magenta)";
                    modified = "[ ](bright-blue)";
                    deleted = "[✘ ](red)";
                };
                golang = {
                    format = " via ";
                };


            };
        };
    };

in
{
  flake.starshipWrapped = starshipWrapped;

  perSystem =
    { pkgs, ... }:
    {
      packages.starship = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ starshipWrapped ];
      };
    };

    flake.nixosModules.starship = {lib, ...}:
         lib.mkMyPkg "starship";
}

