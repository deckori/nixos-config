{
  self,
  username,
  ...
}:
{
  flake.nixosModules.sysMgrUser = { pkgs, lib, ... }: {
    nixpkgs.hostPlatform = "x86_64-linux";

    users.users.root.shell = lib.mkForce "/usr/bin/bash";
    users.users.incogshift.shell = lib.mkForce "/usr/bin/fish";

    environment.sessionVariables = {
      PATH = "/usr/sbin:/usr/local/sbin:/usr/local/MATLAB/R2026b/bin/:$PATH";
    };

    home-manager.users.${username} = {
      home.sessionPath = [
        "/usr/sbin"
        "/usr/local/sbin"
      ];

      home.packages = with pkgs; [
        cargo
        cargo-update
      ];

      imports = [
        self.homeModules.system-manager
        self.homeModules.topgrade

        # self.homeModules.niriSysMgr
        self.homeModules.wmPackages
        self.homeModules.firefoxSysMgr
        self.homeModules.xournalppSysMgr
      ];
    };
  };
}
