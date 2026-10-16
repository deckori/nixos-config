{ self, ... }:

{
  flake.nixosModules.jellyfinSysMgr =
    { lib, nixosModulesPath, ... }:
    {
      config.boot = lib.mkForce {
        kernelModules = [ ];
        isContainer = false;
      };

      imports = [
        (nixosModulesPath + "/services/misc/jellyfin.nix")
        self.nixosModules.jellyfin
      ];
    };
  flake.nixosModules.jellyfin =
    {
      pkgs,
      lib,
      ...
    }:

    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };

      environment.systemPackages = with pkgs; [
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };
}
