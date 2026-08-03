{
  inputs,
  self,
  ...
}:
{
  flake.modules.homeManager.starship =
    {
      wlib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.starship ];

      config = {
        settings = {
          add_newline = true;
          right_format = "$time";
          format = "$directory(white) $git_branch$git_status $character";

          character = {
            success_symbol = "[>](bold green)";

            vimcmd_symbol = "[❮](bold yellow)";
            vimcmd_replace_symbol = "[❮](bold purple)";
          };

          directory = {
            format = "[$path](style)";
            truncation_length = 4;
            truncation_symbol = "../";

          };

          git_branch = {
            symbol = "  ";
            format = "[$symbol$branch](fg:blue italic bold ) ";
          };

          git_status = {
            format = "[[on](white) $all_status $ahead_behind](fg:red)";
            ahead = "[⇡ \${count} ](bold cyan)";
            diverged = "[⇕⇡ \${ahead_count} ⇣\${behind_count} ](bold yellow)";
            behind = "[⇣ \${count} ](bold red) ";
            conflicted = "[ ](magenta) ";
            up_to_date = "[ ](bold bright-green)";
            untracked = "[? ](magenta)";
            modified = "[ ](bright-blue)";
            deleted = "[✘ ](red)";
          };

          time = {
            disabled = false;
            format = "[ $time ]($style)";
            style = "white bold";
            time_format = "%T";
            utc_time_offset = "-3";
          };

          nix_shell = {
            disabled = false;
            impure_msg = "[impure shell](bold red)";
            pure_msg = "[pure shell](bold green)";
            unknown_msg = "[unknown shell](bold yellow)";
            format = "via [☃️ $state(\($name\))](bold blue) ";
          };

        };
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.starship = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ self.modules.homeManager.starship ];
      };
    };
}
