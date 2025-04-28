{ user, ... }:
{
  programs.virt-manager.enable = true;

  users.users.${user} = {
    extraGroups = [
      "libvirtd"
      "kvm"
      "input"
    ];
  };

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
    qemu.swtpm.enable = true;
    qemu.ovmf.enable = true;
  };
  virtualisation.spiceUSBRedirection.enable = true;

  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ];

  systemd.services.libvirtd.preStart = ''
    mkdir -p /var/lib/libvirt/hooks
    chmod 755 /var/lib/libvirt/hooks
    mkdir -p /var/lib/libvirt/hooks/qemu.d/win11/prepare/begin
    chmod 755 /var/lib/libvirt/hooks/qemu.d/win11/prepare/begin
    mkdir -p /var/lib/libvirt/hooks/qemu.d/win11/release/end
    chmod 755 /var/lib/libvirt/hooks/qemu.d/win11/release/end

    # Copy hook files
    cp -f ${virtualization/qemu} /var/lib/libvirt/hooks/qemu
    cp -f ${virtualization/start.sh} /var/lib/libvirt/hooks/qemu.d/win11/prepare/begin/start.sh
    cp -f ${virtualization/stop.sh} /var/lib/libvirt/hooks/qemu.d/win11/release/end/stop.sh

    # Make them executable
    chmod +x /var/lib/libvirt/hooks/qemu
    chmod +x /var/lib/libvirt/hooks/qemu.d/win11/prepare/begin/start.sh
    chmod +x /var/lib/libvirt/hooks/qemu.d/win11/release/end/stop.sh
  '';
}
