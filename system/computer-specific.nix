{ computer, ... }:
{
  config.services.framework16.fingerprint.enable = computer.current == computer.laptop;
  config.services.framework16.storage.enable = computer.current == computer.laptop;
  config.services.nvidia.enable = computer.current == computer.pc;
}
