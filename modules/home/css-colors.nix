{ config, ... }:

with config.lib.stylix.colors;
let
  color = config.lib.stylix.colors;

  inherit (color)
    base00
    base01
    base02
    base03
    base04
    base05
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0E
    ;

  hex = c: "#${c}";
  rgb = c: "rgb(${c})";
in
{
  xdg.configFile."colors.css" = {
    text = ''
      @define-color base01 ${rgb base01}
      @define-color base02 ${rgb base02}
      @define-color base03 ${rgb base03}
      @define-color base04 ${rgb base04}
      @define-color base05 ${rgb base05}
      @define-color base06 ${rgb base06}
      @define-color base07 ${rgb base07}
      @define-color base08 ${rgb base08}
      @define-color base09 ${rgb base09}
      @define-color base10 ${rgb base10}
      @define-color base11 ${rgb base11}
      @define-color base12 ${rgb base12}
      @define-color base13 ${rgb base13}
      @define-color base14 ${rgb base14}
      @define-color base15 ${rgb base15}
    '';
  };
}
