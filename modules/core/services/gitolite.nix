{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  config = lib.mkIf config.consuetudo.programs.gitolite.enable {
    environment.systemPackages = [ pkgs.gitolite ];
    services.gitolite = {
      enable = false;
      adminPubkey = "${inputs.secrets}/.ssh/gitolite.pub";
      enableGitAnnex = true;
    };
  };
}
