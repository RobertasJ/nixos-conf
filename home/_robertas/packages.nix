{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # KDE Applications
    kdePackages.yakuake
    kdePackages.kate
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration

    # Development
    rustc
    rust-analyzer
    rustfmt
    cargo
    clippy
    gcc
    nixd
    nil
    nixfmt-rfc-style
    vscode
    rocmPackages.clang

    # System Tools
    btop
    qmk
    megacmd

    # Applications
    vesktop
    arrpc
    chromium
    kronometer
  ];
}
