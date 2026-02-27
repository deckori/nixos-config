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
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
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
