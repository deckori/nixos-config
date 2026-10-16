{ ... }:

{
  flake.nixosModules.system-manager =
    { pkgs, inputs, ... }:
    let
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        overlays = [ inputs.nixgl.overlay ];
      };
    in
    {
      system-manager.allowAnyDistro = true;
      environment.systemPackages = with pkgs; [
        system-manager
        nixgl.auto.nixGLDefault
      ];

      home-manager = {
        extraSpecialArgs = { inherit (inputs) nixgl; };
      };
    };

  flake.homeModules.system-manager =
    { nixgl, ... }:
    {
      targets.genericLinux.nixGL = {
        # defaultWrapper = "auto.nixGLDefault";
        packages = nixgl.packages;
      };
    };
}
