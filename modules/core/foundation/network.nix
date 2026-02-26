{ pkgs, host, ... }:
{
  networking.networkmanager.enable = true;
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
    "1.1.1.1"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
      10222
      59010
      59011
    ];
    allowedUDPPorts = [
      59010
      59011
    ];
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
}
