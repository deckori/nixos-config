{ ... }:

{
  imports = [
    ./niri.nix
    ./startup.nix
    ./noctalia-shell.nix
    ./design
    ./keybinds
  ];

  programs.niri.settings.screenshot-path = "";
}
