{
  lib,
  config,
  ...
}:

{
  options.consuetudo = {
    wm.enable = lib.mkEnableOption "Desktop environment packages";
  };

  config = lib.mkIf config.consuetudo.services.enable {
    virtualisation.docker.enable = true;
    virtualisation.libvirtd.enable = true;
    consuetudo.programs.gitolite.enable = true;
  };
}
