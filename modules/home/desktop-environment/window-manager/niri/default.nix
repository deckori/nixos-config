{ ... }:

{
  imports = [
    ./niri.nix
    ./noctalia-shell.nix
    ./design
  ];

  programs.niri.settings.screenshot-path = "";
}
