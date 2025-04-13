{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.yakuake
    zoxide
    rustup
    btop
    _1password-gui
    kdePackages.kate
    vesktop
    nixd
    nil
    nixfmt-rfc-style
    jujutsu
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration
    arrpc
  ];
}
