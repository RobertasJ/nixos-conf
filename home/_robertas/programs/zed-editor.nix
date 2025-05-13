{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      rustfmt
      rust-analyzer
      nixd
      nil
      nixfmt-rfc-style
    ];
    extensions = [
      "nix"
      "toml"
      "bash"
      "vscode-dark-plus"
    ];

    userSettings = {
      vim_mode = true;
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "nixd"
            "git-firefly"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };

    userKeymaps = [
      {
        context = "vim_mode == normal";
        bindings = {
          "space t d" = "pane::CloseActiveItem";
          "space t l" = "pane::ActivateNextItem";
          "space c r" = "editor::Rename";
          "space t h" = "pane::ActivatePreviousItem";
        };
      }
      {
        # not editing and not insert mode
        context = "vim_mode == normal";
        bindings = {
          "space q q" = "workspace::CloseWindow";
          "space e" = "workspace::ToggleLeftDock";
          "space space" = "file_finder::Toggle";
          "space w o" = "workspace::Open";
          "space w r" = "projects::OpenRecent";
          "space w shift-r" = "workspace::Reload";
          "ctrl-/" = "terminal_panel::ToggleFocus";
          "ctrl-?" = "workspace::NewTerminal";
        };
      }
      {
        context = "Editor";
        bindings = {
          "alt-right" = "editor::AcceptPartialEditPrediction";
          "alt-j" = "editor::NextEditPrediction";
          "alt-k" = "editor::PreviousEditPrediction";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-/" = "workspace::ToggleBottomDock";
          "ctrl-t d" = "pane::CloseActiveItem";
          "ctrl-t l" = "pane::ActivateNextItem";
          "ctrl-t h" = "pane::ActivatePreviousItem";
        };
      }
      {
        # override built-in keybinds
        context = "Editor";
        bindings = {
          "ctrl-/" = "terminal_panel::ToggleFocus";
        };
      }
    ];
  };
}
