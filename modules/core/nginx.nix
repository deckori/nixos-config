{ inputs, lib, ... }:

{
  services.nginx = {
    enable = false;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    clientMaxBodySize = "1000m";
    virtualHosts = {
      "suwayomi.deck" = {
        # http2 = true;
        locations."/" = {
          proxyPass = "http://${lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/rpi5")}:8888";
          proxyWebsockets = true;
        };
      };
      "photoprism.deck" = {
        forceSSL = false;
        enableACME = false;
        http2 = true;
        locations."/" = {
          proxyPass = "http://${lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/rpi5")}:2342";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $host;
            proxy_buffering off;
          '';
        };
      };
    };
  };
}
