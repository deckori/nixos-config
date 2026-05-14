{ config, lib, ... }:

{
  config.consuetudo.colors = {
    rgb =
      color:
      lib.concatStringsSep "," [
        config.lib.stylix.colors."${color}-rgb-r"
        config.lib.stylix.colors."${color}-rgb-g"
        config.lib.stylix.colors."${color}-rgb-b"
      ];

    rgba =
      color: "${config.consuetudo.colors.rgb color},${toString config.stylix.opacity.applications}";
  };
}
