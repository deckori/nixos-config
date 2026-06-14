{
  inputs,
  pkgs,
  lib,
  username,
  config,
  ...
}:

{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  # services.minecraft-servers = lib.mkIf config.consuetudo.gaming-config.enable {
  services.minecraft-servers = {
    enable = false;
    eula = true;
    openFirewall = true;
    servers = {

      vanilla = {
        enable = false;
        jvmOpts = "-Xmx4G -Xms2G";

        # Specify the custom minecraft server package
        # package = pkgs.minecraftServers.vanilla-server;
      };

      crossplay-server = {

        enable = true;
        package = pkgs.paperServers.paper-26_1_2;
        jvmOpts = "-Xmx4G -Xms2G";

        # Download and inject Geyser + Floodgate automatically via Nix
        symlinks = {
          "plugins/Geyser-Spigot.jar" = pkgs.fetchurl {
            url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
            # You will need to calculate or update the hash when running nixos-rebuild
            hash = "sha256:0snmxmqlr5di2sgvmsa3yb1v1f5fn1s6njj5nin78g538ngkhbzm";
          };
          "plugins/floodgate.jar" = pkgs.fetchurl {
            url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
            hash = "sha256:0c0hibd33891rkgsfkq9b6ffrva7f6rcdwn225m50qvgk1xga7b5";
          };
        };

        # Set up server properties so both systems know where to bind
        serverProperties = {
          gamemode = "creative";
          server-ip = "0.0.0.0";
          server-port = 25565;
        };

        operators.${username} = {
          uuid = "2256cac2-6273-4bd4-b4ab-21fda0e85dcb";
          level = 4;
          bypassesPlayerLimit = true;
        };
      };

    };
  };
}
