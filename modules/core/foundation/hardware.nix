{ pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  zramSwap.enable = true;
}
