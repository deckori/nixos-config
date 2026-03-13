{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.suwayomi-server = {
    package = pkgs.suwayomi-server;
    settings.server.systemTrayEnabled = true;
    settings.server.port = 8888;
  };
}
