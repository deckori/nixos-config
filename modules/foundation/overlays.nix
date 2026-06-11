{ lib, ... }:

{
  flake.nixosModules.overlays =
    { ... }:
    {
      nixpkgs.overlays = [
        # gobatmon fix
        (final: prev: {
          gobatmon = prev.gobatmon.overrideAttrs (old: {
            postPatch =
              (old.postPatch or "")
              + ''
                substituteInPlace internal/battery/battery.go \
                  --replace "BAT0" "BAT1"
              '';
          });
        })

        # qgnomeplatform fix
        (
          final: prev:
          let
            cmakeCompatFix =
              pkg: brokenVersion:
              pkg.overrideAttrs (o: {
                cmakeFlags =
                  (o.cmakeFlags or [ ])
                  ++ lib.optional (
                    brokenVersion || (lib.versionOlder o.version brokenVersion)
                  ) "-DCMAKE_POLICY_VERSION_MINIMUM=3.5";
              });
          in
          {
            # BUGFIX: https://github.com/NixOS/nixpkgs/issues/449595
            qgnomeplatform = cmakeCompatFix prev.qgnomeplatform true;
            qgnomeplatform-qt6 = cmakeCompatFix prev.qgnomeplatform-qt6 true;
          }
        )
      ];
    };
}
