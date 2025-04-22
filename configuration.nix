{ ... }:

{
  imports = [
    system/hardware-configuration.nix
    system/services.nix
    system/locale.nix
    system/mounts.nix
    system/packages.nix
    system/virtualization.nix
    system/boot.nix
    system/programs/steam.nix
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  users.users._robertas = {
    isNormalUser = true;
    description = "Robertas Jankauskas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.partition-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
