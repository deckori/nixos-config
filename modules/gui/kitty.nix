{ ... }:

{
  flake.homeModules.kitty =
    { ... }:
    {
      programs.kitty = {
        enable = true;
        settings = {
          shell = "nu";
        };
      };
    };
}
