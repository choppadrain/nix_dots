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
                format = "$directory$git_branch$git_status";

                directory = {
                    style = "bold italic";
                    format = "[$path](style)";
                    truncation_length = 2;
                    truncation_symbol = "./";

                };

                git_branch = {
                    symbol = "";
                    format = "[ $symbol $branch](fg:blue bold) ";
                };

                git_status = {
                    format = "[$all_status]($style)";
                    style = "red";
                    ahead = ''⇡''${count}'';
                    diverged = ''⇕⇡''${ahead_count}⇣''${behind_count} '';
                    behind = ''⇣''${count} '';
                    conflicted = "";
                    up_to_date = "";
                    untracked = "?";
                    modified = "";
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

