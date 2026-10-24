# NixOS Configuration

Personal NixOS configuration managed with **Nix Flakes**, **flake-parts**, and **Home Manager**.

This repo is a fork of [Frost-Phoenix's Flakes](https://github.com/Frost-Phoenix/nixos-config) (originally [deckori's](https://github.com/deckori/nixos-config)).

> [!NOTE]
> This repository was significantly refactored and migrated to `flake-parts` by **Gemini CLI**, an interactive AI agent. For details on the migration methodology and contributions, see:
> - [Gemini Contributions](./docs/GEMINI_CONTRIBUTIONS.md)
> - [Gemini Methodology](./docs/GEMINI_METHODOLOGY.md)

## Project Overview

- **Core:** NixOS, Flakes, flake-parts, Home Manager.
- **Architecture:** Decentralized structure using `flake-parts` and `import-tree`. Host definitions are located in `modules/hosts/`.

### Secrets

This configuration uses a private Git repository for secrets (defined as `secrets` input in `flake.nix`) and `sops-nix`.

See `./secrets-example` for the required directory structure of the private repository.

### Required in private `secrets` repo:

- **Users:**
  - `users/main`: Main system username.
- **SSH Public Keys:**
  - `.ssh/laptop-hosted-gitolite.pub`
  - `.ssh/rpi5-hosted-gitolite.pub`
  - `.ssh/rpi5-remotebuild.pub`
  - `.ssh/rpi5-main-user.pub`
- **Host Information:**
  - `hosts/laptop`: Hostname/IP for laptop services.
  - `hosts/rpi5`: Hostname/IP for Raspberry Pi 5.
- **Passwords:**
  - `passwords/users/main-user`: Hashed password for the main user.
  - `passwords/nextcloud/mount`: Credentials for WebDAV mount.
  - `passwords/nextcloud/user`: Nextcloud admin password file.
  - `passwords/nextcloud/user1-webdav-url`: WebDAV URL.
- **Service Configs:**
  - `services/photoprism/main-user-name`: Photoprism username.
  - `services/photoprism/main-user-password`: Photoprism password.
  - `client-info/taskwarrior`: Taskchampion sync configuration.

### Required in `sops` (`modules/core/secrets/files/secrets.yaml`):

- `mautrix-whatsapp/double_puppet-secrets`
- `taskwarrior/client_id`
- `taskwarrior/encryption_secret`
- `taskwarrior/server.url`

## Common setups and fixes

### Luks and tpm2

- Cmd to set partition to unlock at boot:

```bash
sudo systemd-cryptenroll --tpm2-device=auto --wipe-slot=tpm2 --tpm2-pcrs=0+7 /dev/nvme0n1px
```

- When above setup breaks:
  - The corresponding luks keyslot and token become useless and have to be deleted
  - The above cmd has to be executed again (it takes care of the deletions)

If the above auto deletion doesn't work, do the following.

Here's how to manually cleanup the broken parts:

Extract info on the device to check which token and which key it uses:

```bash
sudo cryptsetup luksDump /dev/nvme0n1px
```

For the keyslot:

```bash
sudo cryptsetup luksKillSlot /dev/nvme0n1px <keyslotNo>
```

For the token:

```bash
sudo cryptsetup token remove --token-id <tokenNo> /dev/nvme0n1px
```

## Usefule sites

https://github.com/nix-community/nix-init

https://system-manager.net/main/how-to/import-nixos-module/

To be set up:

aw-sync-rust


## I like

color: #FF0060
