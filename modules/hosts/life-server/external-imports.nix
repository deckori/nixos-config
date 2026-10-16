{ self, ... }:

{
  flake.nixosModules.lifeServerExternalImports =
    { nixosModulesPath, ... }:
    {
      imports = [
        # # Service config
        (nixosModulesPath + "/services/audio/navidrome.nix")
        (nixosModulesPath + "/security/ca.nix")
        self.nixosModules.navidrome
        self.nixosModules.navidromeSysMgr

        (nixosModulesPath + "/services/torrent/qbittorrent.nix")
        self.nixosModules.qbittorrent
      ];
    };
}
