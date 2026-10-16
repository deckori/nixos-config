{ self, ... }:

{
  flake.nixosModules.jellyfinSysMgr =
    { lib, nixosModulesPath, ... }:
    {
      options.boot.kernelModules = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };

      options.boot.isContainer = lib.mkOption {
        type = lib.types.bool;
        default = false;
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
