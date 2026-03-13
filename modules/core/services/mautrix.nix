{
  pkgs,
  config,
  username,
  ...
}:

let
  pkgsWithOlm = import pkgs.path {
    system = pkgs.system;
    config = {
      permittedInsecurePackages = [ "olm-3.2.16" ];
    };
  };
in
{
  services.mautrix-whatsapp = {
    package = pkgsWithOlm.mautrix-whatsapp;
    settings = {
      appservice = {
        as_token = "";
        bot = {
          displayname = "WhatsApp Bridge Bot";
          username = "whatsappbot";
        };
        hostname = "[::]";
        hs_token = "";
        id = "whatsapp";
        port = 29318;
        username_template = "whatsapp_{{.}}";
      };
      bridge = {
        command_prefix = "!wa";
        permissions = {
          "@${username}:rpi5" = "admin";
          "@adminc:rpi5" = "admin";
        };
        relay = {
          enabled = true;
        };
      };
      database = {
        type = "sqlite3-fk-wal";
        uri = "file:/var/lib/mautrix-whatsapp/mautrix-whatsapp.db?_txlock=immediate";
      };
      direct_media = {
        server_key = "";
      };
      double_puppet = {
        secrets = { };
        servers = { };
      };
      encryption = {
        pickle_key = "";
      };
      homeserver = {
        address = "http://${config.services.matrix-conduit.settings.global.address}:${toString config.services.matrix-conduit.settings.global.port}";
      };
      logging = {
        min_level = "info";
        writers = [
          {
            format = "pretty-colored";
            time_format = " ";
            type = "stdout";
          }
        ];
      };
      network = {
        displayname_template = "{{or .BusinessName .PushName .Phone}} (WA)";
        history_sync = {
          request_full_sync = true;
        };
        identity_change_notices = true;
      };
      backfill = {
        enabled = true;
        # Maximum number of messages to backfill in empty rooms.
        max_initial_messages = 100;
        # Maximum number of missed messages to backfill after bridge restarts.
        max_catchup_messages = 500;
        # If a backfilled chat is older than this number of hours,
        # mark it as read even if it's unread on the remote network.
        unread_hours_threshold = 720;
        # Settings for backfilling threads within other backfills.
        threads = {
          # Maximum number of messages to backfill in a new thread.
          max_initial_messages = 50;
        };
        # Settings for the backwards backfill queue. This only applies when connecting to
        # Beeper as standard Matrix servers don't support inserting messages into history.
        queue = {
          # Should the backfill queue be enabled?
          enabled = true;
          # Number of messages to backfill in one batch.
          batch_size = 100;
          # Delay between batches in seconds.
          batch_delay = 60;
          # Maximum number of batches to backfill per portal.
          # If set to -1, all available messages will be backfilled.
          max_batches = -1;
          # Optional network-specific overrides for max batches.
          # Interpretation of this field depends on the network connector.
          max_batches_override = { };
        };
      };
      provisioning = {
        shared_secret = "";
      };
      public_media = {
        signing_key = "";
      };
    };
  };

  sops = {
    secrets."mautrix-whatsapp/double_puppet-secrets" = { };
    templates."mautrix-whatsapp/environmentFile" = {
      content = "MAUTRIX_WHATSAPP_BRIDGE_LOGIN_SHARED_SECRET=${
        config.sops.placeholder."mautrix-whatsapp/double_puppet-secrets"
      } ";
    };
  };
  services.mautrix-whatsapp.environmentFile =
    config.sops.templates."mautrix-whatsapp/environmentFile".path;
}
