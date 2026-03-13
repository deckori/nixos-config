{ ... }:

{
  imports = [
    ./display-manager.nix
    ./hyprland.nix
  ];

  home-manager.users.REDACTED = {
    imports = [ ./home-manager ];
  };
}
