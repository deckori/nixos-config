{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
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
      PHOTOPRISM_SITE_URL = "http://sub.photoprism.deck:2342";
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

  services.nginx = {
    enable = config.services.photoprism.enable;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    clientMaxBodySize = "500m";
    virtualHosts = {
      "sub.photoprism.deck" = {
        forceSSL = false;
        enableACME = false;
        http2 = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:2342";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $host;
            proxy_buffering off;
            proxy_http_version 1.1;
          '';
        };
      };
    };
  };
}
