{ ... }:

{
  flake.nixosModules.noctalia-greeter =
    {
      pkgs,
      inputs,
      username,
      ...
    }:
    {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

      services.displayManager.noctalia-greeter = {
        enable = true;

        # Optional configuration
        extraArgs = [
          "--session"
          "niri"
          "--user"
          "${username}"
        ];
        # Full declarative greeter.toml (overwritten on each activation).
        # See examples/greeter.toml for every key (appearance.palette, output, …).
        settings = {
          cursor = {
            theme = "Bibata-Modern-Ice";
            size = 24;
            path = "${pkgs.bibata-cursors}/share/icons";
          };
          keyboard = {
            layout = "us";
          };
        };
      };
    };
}
