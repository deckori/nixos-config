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
        self.nixosModules.navidrome
      ];
    };
}
