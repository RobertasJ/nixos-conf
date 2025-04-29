{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # KDE Applications
    kdePackages.yakuake
    zoxide
    kdePackages.kate
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration

    # Development
    rustc
    rust-analyzer
    cargo
    clippy
    gcc
    nixd
    nil
    nixfmt-rfc-style
    vscode

    # System Tools
    btop
    qmk
    megacmd

    # Applications
    vesktop
    arrpc
    chromium
  ];
}
