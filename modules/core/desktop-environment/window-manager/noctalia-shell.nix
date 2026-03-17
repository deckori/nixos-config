{ pkgs, ... }:

{
  # Calender events dependancy
  services.gnome.evolution-data-server.enable = true;
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
