{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noctalia-shell
  ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

}
