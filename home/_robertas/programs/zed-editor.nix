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
      terminal = {
        line_height = {
          custom = 1;
        };
      };
      vim_mode = true;
      lsp = {
        rust-analyzer = {
          initialization_options = {
            inlayHints = {
              closureReturnTypeHints = {
                enable = "always";
              };
            };
            cargo = {
              features = [ ];
            };
          };
          completion = {
            snippets = {
              custom = {
                "Arc::new" = {
                  postfix = "arc";
                  body = [ "Arc::new(\${receiver})" ];
                  requires = "std::sync::Arc";
                  scope = "expr";
                };
                "Some" = {
                  postfix = "some";
                  body = [ "Some(\${receiver})" ];
                  scope = "expr";
                };
                "Ok" = {
                  postfix = "ok";
                  body = [ "Ok(\${receiver})" ];
                  scope = "expr";
                };
                "Rc::new" = {
                  postfix = "rc";
                  body = [ "Rc::new(\${receiver})" ];
                  requires = "std::rc::Rc";
                  scope = "expr";
                };
                "Box::pin" = {
                  postfix = "boxpin";
                  body = [ "Box::pin(\${receiver})" ];
                  requires = "std::boxed::Box";
                  scope = "expr";
                };
                "vec!" = {
                  postfix = "vec";
                  body = [ "vec![\${receiver}]" ];
                  description = "vec![]";
                  scope = "expr";
                };
              };
            };
          };
        };
      };
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
          "ctrl-s" = "workspace::SaveAll";
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
