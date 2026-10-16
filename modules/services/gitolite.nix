{ self, ... }:

{
  flake.nixosModules.gitolite =
    {
      inputs,
      pkgs,
      lib,
      ...
    }:

    {
      services.gitolite = {
        enable = true;
        enableGitAnnex = true;
        adminPubkey = (
          lib.strings.removeSuffix "\n" (
            builtins.readFile "${inputs.secrets}/.ssh/laptop-hosted-gitolite.pub"
          )
        );
      };
    };
  # Not worth using cuz it somehow triggers a build from source
  flake.nixosModules.gitoliteSysMgr =
    { nixosModulesPath, ... }:
    {
      imports = [
        (nixosModulesPath + "/services/misc/gitolite.nix")
        self.nixosModules.gitolite
      ];
    };
}
