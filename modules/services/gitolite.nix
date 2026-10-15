{ self, ... }:

{
  flake.nixosModules.gitoliteSysMgr =
    { nixosModulesPath, ... }:
    {
      imports = [
        self.nixosModules.gitolite
      ];
    };
  flake.nixosModules.gitolite =
    {
      inputs,
      pkgs,
      ...
    }:

    {
      services.gitolite = {
        enableGitAnnex = true;
      };
    };
}
