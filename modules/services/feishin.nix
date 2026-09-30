{ self, ... }:
{
  flake.nixosModules.feishinSysMgr = { nixosModulesPath, ... }: {
    imports = [
      (nixosModulesPath + "/services/web-apps/feishin.nix")
      (nixosModulesPath + "/services/web-servers/caddy/default.nix")
      self.nixosModules.feishin
    ];
  };

  flake.nixosModules.feishin =
    { pkgs, laptop, ... }:
    {
      services.feishin = {
        enable = true;
        domain = "localhost:9180, :9180";
        caddy.enable = true;
      };
    };
}
