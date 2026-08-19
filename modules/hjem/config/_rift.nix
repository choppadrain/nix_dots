{ ... }: {
  osama.modules.desktop = { pkgs, ... }: {
    hj.xdg.config.files = {
      "rift/config.toml".source = (pkgs.formats.toml { }).generate "rift-config" {
        settings = {
          animate = false;
          focus_follows_mouse = true;
          mouse_follows_focus = true;
          mouse_hides_on_focus = true;
          auto_focus_blacklist = [ ];
          run_on_start = [ ];
          hot_reload = true;

          layout = {
            mode = "traditional";
            window_insertion_point = "next_to_selection";
            traditional = {
              equalize_nodes = true;
            };
          };
        };
        modifier_combinations = {
          comb1 = "Alt + Shift";
        };

        virtual_workspaces = {
          enabled = true;
          default_workspace_count = 4;
          auto_assign_windows = true;
          preserve_focus_per_workspace = true;
          workspace_auto_back_and_forth = false;
          prevent_wrapping = false;
          reapply_app_rules_on_title_change = false;
        };
/*nixfmt:disable*/
        keys = {
  "Alt + Z"   = "toggle_space_activated";

  "Alt + H"   = { move_focus = "left"; };
  "Alt + J"   = { move_focus = "down"; };
  "Alt + K"   = { move_focus = "up"; };
  "Alt + L"   = { move_focus = "right"; };

  "comb1 + H" = { move_node = "left"; };
  "comb1 + J" = { move_node = "down"; };
  "comb1 + K" = { move_node = "up"; };
  "comb1 + L" = { move_node = "right"; };

  "Alt + 1"   = { switch_to_workspace = 1; };
  "Alt + 2"   = { switch_to_workspace = 2; };
  "Alt + 3"   = { switch_to_workspace = 3; };
  "Alt + 4"   = { switch_to_workspace = 4; };

  "Alt + Tab" = "switch_to_last_workspace";

"Alt + Shift + Space" = "toggle_window_floating";
"Alt + F" = "toggle_fullscreen";
"Alt + Shift + F" = "toggle_fullscreen_within_gaps";
"comb1 + Ctrl + Space" = "toggle_focus_floating";

"Alt + Shift + Equal" = "resize_window_grow";
"Alt + Shift + Minus" = "resize_window_shrink";
/*nixfmt:enable*/
        };
      };

    };
  };
}
