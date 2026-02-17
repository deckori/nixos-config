{ ... }:

{
  imports = [
    ./gui
    ./desktop-environment
    ./home-manager.nix
    ./display-manager
    ./cli
    ./secrets
    ./foundation
    ./services
    ./option.nix
    ./misc.nix
  ];
}
