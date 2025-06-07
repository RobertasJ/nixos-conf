{ config, lib, ... }:
with lib;
{
  options.environment.binbash = {
    enable = mkEnableOption "Creates a symlink from /bin/bash to the system's bash";
  };

  config.system.activationScripts.binbash =
    if config.environment.binbash.enable then
      ''
        mkdir -p /bin
        cat > /bin/bash << 'EOF'
        /run/current-system/sw/bin/bash "$@"
        EOF
        chmod +x /bin/bash
      ''
    else
      ''
        if [ -e /bin/bash ]; then
          rm -f /bin/bash
        fi
      '';
}
