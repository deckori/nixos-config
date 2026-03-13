{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      gobatmon = prev.gobatmon.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          substituteInPlace internal/battery/battery.go \
            --replace "BAT0" "BAT1"
        '';
      });
    })
  ];
}
