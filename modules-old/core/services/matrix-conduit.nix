{ config, ... }:

{
  services.matrix-conduit = {
    settings.global = {
      server_name = config.networking.hostName;
      allow_registration = true;
      allow_federation = false;
    };
  };
}
