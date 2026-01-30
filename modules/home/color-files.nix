{ config, lib, ... }:
with config.consuetudo.colors;
{
  xdg.configFile."colors-rgb.css" = {
    text = ''
      @define-color base00 rgb(${rgb "base00"})
      @define-color base01 rgb(${rgb "base01"})
      @define-color base02 rgb(${rgb "base02"})
      @define-color base03 rgb(${rgb "base03"})
      @define-color base04 rgb(${rgb "base04"})
      @define-color base05 rgb(${rgb "base05"})
      @define-color base08 rgb(${rgb "base08"})
      @define-color base09 rgb(${rgb "base09"})
      @define-color base0A rgb(${rgb "base0A"})
      @define-color base0B rgb(${rgb "base0B"})
      @define-color base0C rgb(${rgb "base0C"})
      @define-color base0D rgb(${rgb "base0D"})
      @define-color base0E rgb(${rgb "base0E"})
      @define-color base0F rgb(${rgb "base0F"})
    '';
  };

  xdg.configFile."colors-rgba.css" = {
    text = ''
      @define-color base00 rgba(${rgba "base00"})
      @define-color base01 rgba(${rgba "base01"})
      @define-color base02 rgba(${rgba "base02"})
      @define-color base03 rgba(${rgba "base03"})
      @define-color base04 rgba(${rgba "base04"})
      @define-color base05 rgba(${rgba "base05"})
      @define-color base08 rgba(${rgba "base08"})
      @define-color base09 rgba(${rgba "base09"})
      @define-color base0A rgba(${rgba "base0A"})
      @define-color base0B rgba(${rgba "base0B"})
      @define-color base0C rgba(${rgba "base0C"})
      @define-color base0D rgba(${rgba "base0D"})
      @define-color base0E rgba(${rgba "base0E"})
      @define-color base0F rgba(${rgba "base0F"})
    '';
  };
}
