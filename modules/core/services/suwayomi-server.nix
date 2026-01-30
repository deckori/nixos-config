{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.suwayomi-server.enable {
    services.suwayomi-server = {
      package = pkgs.suwayomi-server;
      settings.server.systemTrayEnabled = true;
    };
  };
}
