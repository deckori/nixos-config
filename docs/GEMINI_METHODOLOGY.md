# Gemini CLI Methodology: flake-parts Migration

This document explains how the migration from a traditional Nix flake structure to `flake-parts` was executed.

## 1. Architectural Strategy
The core goal was to move from a centralized `flake.nix` with manual host definitions to a modular, decentralized structure using `flake-parts` and `import-tree`.

### Key Components:
- **`flake-parts`**: Provides a module system for flakes, allowing outputs to be defined in separate files.
- **`import-tree`**: Automatically crawls the `modules/` directory and merges all modules into the flake.
- **`_module.args`**: Used to pass global variables (like `username`) to all modules, reducing boilerplate in host definitions.

## 2. Migration Workflow
For each host and module, a strict **Convert -> Commit -> Import -> Test -> Commit** cycle was followed:

1.  **Module Conversion**: Traditional NixOS modules were wrapped in `flake.nixosModules.<name>` blocks. This makes them discoverable by other parts of the flake via `self.nixosModules`.
2.  **Host Migration**: Host definitions were moved to `modules/hosts/<hostname>/<hostname>.nix`.
3.  **SpecialArgs Handling**: Passed `inputs`, `self`, and `username` through `specialArgs` to ensure system modules have access to flake inputs and global state.
4.  **Verification**: Every significant change was verified using `nixos-rebuild build --flake .#<host>` to ensure the new structure evaluated correctly and produced a valid system derivation.

## 3. Global State Management
Instead of passing `username` manually to every function, we implemented a global configuration module in `modules/config/globals.nix` that uses `_module.args` to make the primary username available everywhere.

## 4. Disko Integration
Hardware-specific configurations like `disko` were converted into flake modules (e.g., `self.nixosModules.rpi5DiskConfiguration`), allowing them to be imported cleanly into host definitions without hardcoded paths.
