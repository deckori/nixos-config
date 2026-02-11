{
  lib,
  config,
  ...
}:

{
  options.consuetudo = {

    wm.enable = lib.mkEnableOption "Desktop environment packages";

    services.enable = lib.mkEnableOption "Service packages";

  };

  config = lib.mkIf config.consuetudo.services.enable {
    virtualisation.docker.enable = true;
    virtualisation.libvirtd.enable = true;
    consuetudo.programs.gitolite.enable = true;
    services = {
      avahi.enable = true;
      odoo.enable = true;
      davfs2.enable = false;
      gotenberg.enable = true;
      suwayomi-server.enable = true;
      nextcloud.enable = false;
      taskchampion-sync-server.enable = true;
    };
  };
}
