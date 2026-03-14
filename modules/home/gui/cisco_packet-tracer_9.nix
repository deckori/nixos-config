{
  pkgs,
  config,
  lib,
  ...
}:

{
  options.consuetudo.programs.cisco-packet-tracer_9.enable =
    lib.mkEnableOption "Packet Tracer Configurations";

  config = lib.mkIf config.consuetudo.programs.cisco-packet-tracer_9.enable {
    home.packages = with pkgs; [
      cisco-packet-tracer_9 # Go to https://www.netacad.com/resources/lab-downloads?courseLang=en-US to download CiscoPacketTracer900_amd64_signed.deb (If the file name is different, change it to as required by nix). Reason is cuz of:
      /*
              Unfortunately, we cannot download file CiscoPacketTracer900_amd64_signed.deb automatically.
              > Please go to https://www.netacad.com to download it yourself, and add it to the Nix store
              > using either
        Current name
              >   nix-store --add-fixed sha256 CiscoPacketTracer_900_Ubuntu_64bit.deb
              > or
              >   nix-prefetch-url --type sha256 file:///path/to/CiscoPacketTracer_900_Ubuntu_64bit.deb
      */
    ];

    xdg.desktopEntries."cisco-packet-tracer_9" = {
      name = "Cisco Packet Tracer 9";
      icon = "${pkgs.cisco-packet-tracer_9}/opt/pt/art/app.png";
      exec = "packettracer9 %f";
      mimeType = [
        "application/x-pkt"
        "application/x-pka"
        "application/x-pkz"
        "application/x-pksz"
      ];
    };

    xdg.dataFile."mime/packages/cisco-packet-tracer.xml".text = ''
      <?xml version="1.0" encoding="utf-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">

        <mime-type type="application/x-pkt">
          <glob pattern="*.pkt"/>
          <comment>Cisco Packet Tracer Topology</comment>
          <icon name="x-office-document"/>
        </mime-type>

        <mime-type type="application/x-pka">
          <glob pattern="*.pka"/>
          <comment>Cisco Packet Tracer Activity</comment>
          <icon name="x-office-document"/>
        </mime-type>

        <mime-type type="application/x-pkz">
          <glob pattern="*.pkz"/>
          <comment>Cisco Packet Tracer Compressed Project</comment>
          <icon name="x-office-document"/>
        </mime-type>

        <mime-type type="application/x-pks">
          <glob pattern="*.pks"/>
          <comment>Cisco Packet Tracer Script</comment>
          <icon name="x-office-document"/>
        </mime-type>

        <mime-type type="application/x-pksz">
          <glob pattern="*.pksz"/>
          <comment>Cisco Packet Tracer Compressed Script</comment>
          <icon name="x-office-document"/>
        </mime-type>

      </mime-info>
    '';
  };
}
