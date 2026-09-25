{ self, ... }:

{
  flake.nixosModules.lifeServerExternalImports =
    { nixosModulesPath, ... }:
    {
      imports = [
        # # Service config
        (nixosModulesPath + "/services/web-apps/baikal.nix")
        (nixosModulesPath + "/services/web-servers/phpfpm/default.nix")
        self.nixosModules.baikal
        self.nixosModules.baikalSysMgr

        (nixosModulesPath + "/services/audio/navidrome.nix")
        (nixosModulesPath + "/security/ca.nix")
        self.nixosModules.navidrome
        self.nixosModules.navidromeSysMgr

        (nixosModulesPath + "/services/torrent/qbittorrent.nix")
        self.nixosModules.qbittorrent

        (nixosModulesPath + "/services/misc/jellyfin.nix")
        self.nixosModules.jellyfin
      ];
    };
}
