{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.yakuake
    zoxide
    rustc
    cargo
    clippy
    btop
    kdePackages.kate
    vesktop
    nixd
    nil
    nixfmt-rfc-style
    jujutsu
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration
    arrpc
    qmk
    chromium
    vscode
  ];
}
