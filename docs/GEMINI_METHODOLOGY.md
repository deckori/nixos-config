# Gemini CLI Methodology

This document explains the technical approach taken by Gemini CLI to resolve configuration issues and perform migrations in this repository.

## 1. Addressing the `proton-gdk` Unfree Error
The issue was that `proton-gdk` (an unfree package) was being evaluated from an external flake (`nixpkgs-custom`) that did not have `allowUnfree = true` configured in its own Nixpkgs instance.

### Solution:
- **Overlay Pattern**: Instead of importing a pre-evaluated package from a foreign flake, we converted the `proton-gdk` definition into a native NixOS overlay (`overlays/proton-gdk.nix`).
- **Module Wrapper**: We wrapped the overlay in a NixOS module to match the existing repository pattern used for `gobatmon.nix`.
- **Main Nixpkgs Context**: By using an overlay, `proton-gdk` is now evaluated within the main system's Nixpkgs context, which correctly respects the `nixpkgs.config.allowUnfree = true` setting.

## 2. Flake Parts Migration (Experimental)
Work was started on a `flake-parts` branch to modularize the flake architecture.

### Strategy:
- **`import-tree`**: Used to automatically discover and merge modules from the `modules/` directory.
- **Decentralization**: Host definitions were moved from `flake.nix` into specialized host modules under `modules/hosts/`.
- **Global Args**: Leveraged `_module.args` to propagate variables like `username` globally without manual function arguments.

## 3. Verification Workflow
Every change was verified using:
```bash
nixos-rebuild build --flake .#laptop --accept-flake-config
```
This ensured that any architectural shifts did not break the final system derivation.
