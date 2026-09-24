{ ... }:

{
  flake.nixosModules.lifeServerConfig = { pkgs, ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    system-manager.allowAnyDistro = true;

    nixpkgs.hostPlatform = "x86_64-linux";

    environment.systemPackages = with pkgs; [
      aw-server-rust
    ];
  };
}
