{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        fill-labs.dependi
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        mkhl.direnv
        vscodevim.vim
        tamasfe.even-better-toml
        eamodio.gitlens
        ms-vsliveshare.vsliveshare
        jnoortheen.nix-ide
        arrterian.nix-env-selector
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "dioxus";
          publisher = "DioxusLabs";
          version = "0.6.0";
          sha256 = "sha256-UYMJf0F8YjH1s7szIdTDG7t31/xjryD3wxogQM4ywOU=";
        }
        {
          name = "nasm";
          publisher = "LucianIrsigler";
          version = "1.3.1";
          sha256 = "sha256-N5f3daQyhvBh1u4qjFpWMZzeLQzPMh+E7+du+4fC4pI=";
        }
        {
          name = "jjk";
          publisher = "jjk";
          version = "0.8.1";
          sha256 = "sha256-2JUn6wkWgZKZzhitQy6v9R/rCNLrt7DBtt59707hp6c=";
        }
      ];

    profiles.default.userSettings = {
      git.enabled = false;
      editor.formatOnSave = true;
      editor.formatOnPaste = true;
      vim = {
        leader = "<space>";
        useSystemClipboard = true;
        normalModeKeyBindings = [
          {
            before = [
              "<leader>"
              "w"
              "r"
            ];
            commands = [ "workbench.action.openRecent" ];
          }
        ];
      };
    };
  };
}
