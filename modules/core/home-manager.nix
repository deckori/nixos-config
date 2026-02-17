{
  inputs,
  pkgs-custom,
  pkgs-unstable,
  username,
  host,
  ...
}:
{
  home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.sops-nix.homeManagerModules.sops
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      inputs.stylix.homeManagerModules.stylix
    ];
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        pkgs-custom
        pkgs-unstable
        host
        ;
    };
    backupFileExtension = "hm-backup";
  };
}
