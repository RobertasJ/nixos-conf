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
    vscode-fhs
    android-studio
    rocmPackages.clang

    # System Tools
    btop-rocm
    qmk
    megasync
    ffmpeg

    # Applications
    vesktop
    arrpc
    chromium
    kronometer
    prismlauncher
    obs-studio
    r2modman
    wlx-overlay-s
    bs-manager
  ];
}
