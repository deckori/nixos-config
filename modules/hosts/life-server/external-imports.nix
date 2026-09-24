{ self, ... }:

{
  flake.nixosModules.lifeServerExternalImports =
    { nixosModulesPath, ... }:
    {
      imports = [
        # # Service config
        (nixosModulesPath + "/services/web-apps/baikal.nix")
        self.nixosModules.baikal
      ];
    };
}
