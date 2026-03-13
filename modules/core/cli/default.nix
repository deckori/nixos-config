{ username, ... }:

{
  imports = [
    ./btop.nix
    ./shell.nix
    ./misc.nix
    ./openssh.nix
  ];
}
