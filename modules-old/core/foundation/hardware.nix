{ pkgs, ... }:
{
  # OpenGL
  hardware.graphics = {
    enable = true;
  };

  hardware.enableRedistributableFirmware = true;

  zramSwap.enable = true;
}
