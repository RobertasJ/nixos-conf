{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # KDE Applications
    kdePackages.yakuake
    kdePackages.kate
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration

    # Development
    rustup
    gcc
    nixd
    nil
    nixfmt-rfc-style
    android-studio-full
    rocmPackages.clang

    # System Tools
    btop-rocm
    qmk
    megasync
    ffmpeg
    caligula # etcher

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
