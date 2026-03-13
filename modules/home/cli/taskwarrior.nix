{
  pkgs,
  lib,
  pkgs-custom,
  config,
  ...
}:

{
  sops = {
    secrets."taskwarrior/client_id" = { };
    secrets."taskwarrior/encryption_secret" = { };
    secrets."taskwarrior/server.url" = { };

    templates."taskwarrior-sync-conf" = {
      content = ''
        sync.server.client_id=${config.sops.placeholder."taskwarrior/client_id"}
        sync.encryption_secret=${config.sops.placeholder."taskwarrior/encryption_secret"}
        sync.server.url=${config.sops.placeholder."taskwarrior/server.url"}
      '';
    };
  };
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    extraConfig = ''
      include ${config.sops.templates."taskwarrior-sync-conf".path}
    '';
  };
  services.taskwarrior-sync = {
    enable = true;
  };

  # not sure if i can use with syntax over here
  home.packages =
    with pkgs;
    [
      timewarrior
      taskwarrior-tui
    ]
    ++ lib.optionals (stdenv.hostPlatform.system == "x86_64-linux") [
      pkgs-custom.taskopen
    ];
}
