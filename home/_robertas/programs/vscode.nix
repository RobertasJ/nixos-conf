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
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "nix-extension-pack";
          publisher = "pinage404";
          version = "3.0.0";
          sha256 = "sha256-cWXd6AlyxBroZF+cXZzzWZbYPDuOqwCZIK67cEP5sNk=";
        }
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
      ];

    profiles.default.userSettings = {
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
