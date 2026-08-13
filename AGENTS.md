## Overview

Personal Nix home-manager configuration (flake-based, x86_64-linux, WSL) for user `allens3`. Uses nixvim for Neovim configuration.

## Commands

Apply the configuration (DON'T run unless specifically prompted):
```
home-manager switch --flake .#allens3
```

Verify the config evaluates/builds without activating:
```
home-manager build --flake .#allens3
```

Update flake inputs: `nix flake update`

Format Nix files: `nixfmt` (nixfmt-rfc-style is the installed formatter)

## Architecture

- `flake.nix` — flake entry point; wires nixpkgs (nixos-unstable), home-manager, and nixvim into the single `homeConfigurations."allens3"` output.
- `home.nix` — top-level home-manager module: package list, session variables, and imports of each `programs/*/default.nix`.
- `config.nix` — personal identity values (git user, email), exposed to modules as the `me` module arg via `_module.args.me`.
- `programs/<name>/` — one directory per configured program (git, neovim, tmux, zsh). Each `default.nix` auto-imports every sibling `.nix` file in its directory, so adding a new `.nix` file to a program directory picks it up automatically — no import edits needed. Adding a whole new program directory does require adding its `default.nix` to the imports list in `home.nix`.
- Neovim config is split across `programs/neovim/` (options, keymaps, plugins, aliases) using nixvim's module options rather than Lua files.

## Conventions

- Keep changes related to specific plugins/programs packaged together in the file structure to increase modularity
