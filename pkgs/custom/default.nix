{ ... }:
{
  imports = [
    ./tokei-all.nix
    ./program-chooser/program-chooser.nix
    ./pano-scrobbler-bin
    ./nix-search/nix-search.nix # TUI to search nixpkgs
  ];
}
