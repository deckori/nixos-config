# Gemini Context: NixOS Configuration

Personal NixOS configuration managed with **Nix Flakes** and **Home Manager**.

## Project Overview

- **Core:** NixOS, Flakes, Home Manager.
- **Architecture:** Split between `hosts/` (host-specific) and `modules/` (reusable logic).
- **Theming:** **Stylix** for universal application theming.
- **Security:** **Sops-nix** for secret management, **Lanzaboote** for Secure Boot.
- **Hosts:**
    - `laptop`: Main workstation (Niri, Plasma 6, Flatpak).
    - `vm`: Virtual machine setup.
    - `rpi5`: Raspberry Pi 5 (uses Disko for declarative partitioning).
    - `s25`: Nix-on-Droid (mobile phone configuration).

## Building and Running

### Installation

Use the interactive install script for a guided setup:

```bash
./install.sh
```

This script handles:
1.  Username configuration.
2.  Host selection (`desktop`, `laptop`, `vm`).
3.  Copying `/etc/nixos/hardware-configuration.nix` to the project directory.
4.  Running the initial `nixos-rebuild switch`.

### Manual Build

Apply changes manually using `nixos-rebuild`:

```bash
# Replace <host> with laptop, vm, or rpi5
sudo nixos-rebuild switch --flake .#<host>
```

### Formatting

Format the entire codebase using `treefmt`:

```bash
nixfmt-tree .
# or via the dev shell
treefmt
```

## Architecture

- **`flake.nix`**: The entry point. Manages all inputs (nixpkgs versions, external flakes) and defines system outputs.
- **`hosts/`**: Contains host-specific configurations (`default.nix`, `hardware-configuration.nix`).
- **`modules/`**:
    - `core/`: System-wide NixOS modules (services, bootloader, networking).
    - `home/`: User-level Home Manager modules (shell, editor, desktop environment).
    - `shared-modules.nix`: Common imports required by all hosts.
- **`overlays/`**: Custom package overrides and additions.
- **`wallpapers/`**: Desktop wallpapers used by Stylix and other UI components.

## Development Conventions

- **Secrets:** This project relies on a private Git repository for secrets (defined in `flake.nix`). Ensure `deck-repos` is configured in your SSH config.
- **State Version:** The project uses `system.stateVersion = "26.05"` (bleeding edge) or specific stable versions depending on the host.
- **Nix LSP:** A `devShell` is provided with `nil` (Nix Language Server) and `nixpkgs-fmt`. Enter it with `nix develop`.

## Key Dependencies

- `nixpkgs`: Primarily uses `nixos-unstable`.
- `home-manager`: User environment management.
- `stylix`: Automatic theming.
- `sops-nix`: Encrypted secrets.
- `disko`: Declarative disk management (RPi5).
- `lanzaboote`: Secure Boot support.
- `winapps`: Running Windows applications on Linux.
