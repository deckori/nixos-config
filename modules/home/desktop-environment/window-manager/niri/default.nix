{ ... }:

{
  imports = [
    ./niri.nix
    ./startup.nix
    ./noctalia-shell.nix
    ./design
    ./io.nix
    ./keybinds
  ];

  programs.niri.settings.screenshot-path = "";
}
