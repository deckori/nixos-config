{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  config = lib.mkIf config.services.photoprism.enable {
    services.photoprism = {
      port = 2342;
      originalsPath = "/jelly";
      address = "0.0.0.0";
      settings = {
        PHOTOPRISM_ADMIN_USER = (
          lib.strings.removeSuffix "\n" (
            builtins.readFile "${inputs.secrets}/services/photoprism/main-user-name"
          )
        );
        PHOTOPRISM_ADMIN_PASSWORD = (
          lib.strings.removeSuffix "\n" (
            builtins.readFile "${inputs.secrets}/services/photoprism/main-user-password"
          )
        );
        PHOTOPRISM_DEFAULT_LOCALE = "en";
        PHOTOPRISM_DATABASE_DRIVER = "mysql";
        PHOTOPRISM_DATABASE_NAME = "photoprism";
        PHOTOPRISM_DATABASE_SERVER = "/run/mysqld/mysqld.sock";
        PHOTOPRISM_DATABASE_USER = "photoprism";
        PHOTOPRISM_SITE_URL = "http://photoprism.deck:2342";
        PHOTOPRISM_SITE_TITLE = "My PhotoPrism";
      };
    };

    services.mysql = {
      enable = config.services.photoprism.enable;
      dataDir = "/data/mysql";
      package = pkgs.mariadb;
      ensureDatabases = [ "photoprism" ];
      ensureUsers = [
        {
          name = "photoprism";
          ensurePermissions = {
            "photoprism.*" = "ALL PRIVILEGES";
          };
        }
      ];
    };
  };
}
