{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.yakuake
    zoxide
    rustc
    rust-analyzer
    cargo
    clippy
    gcc
    btop
    kdePackages.kate
    vesktop
    nixd
    nil
    nixfmt-rfc-style
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration
    arrpc
    qmk
    chromium
    vscode
    megacmd
  ];
}
