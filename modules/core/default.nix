{ ... }:

{
  imports = [
    ../shared-modules.nix
    ./gui
    ./nginx.nix
    ./desktop-environment
    ./home-manager.nix
    ./display-manager
    ./home-cachix
    ./cli
    ./secrets
    ./foundation
    ./services
    ./misc.nix
  ];
}
