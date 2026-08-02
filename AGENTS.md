# AGENTS.md

## Repository purpose

This repository manages Ehco's macOS-oriented terminal development environment. It installs command-line dependencies and symlinks the tracked configuration files into their expected locations under `$HOME`.

The repository is intentionally small and has no build system or automated test suite. Keep changes focused and avoid introducing framework or tooling overhead for simple configuration updates.

## File map

- `setup.sh`: idempotent bootstrap entry point; installs Homebrew packages, creates symlinks, and installs mise-managed tools.
- `zshrc`: interactive Zsh environment, history, completions, plugins, aliases, and SSH/tmux wrappers.
- `tmux.conf`: tmux behavior, status bar, and TPM plugin declarations.
- `ghostty.conf`: Ghostty terminal appearance and behavior.
- `starship.toml`: Starship prompt configuration; linked to `~/.config/starship.toml`.
- `mise/config.toml`: language runtime and package-manager versions.
- `readme.md`: user-facing installation and tool-management documentation.

## Change guidelines

- Preserve the existing split of responsibilities: Homebrew for system tools and shell plugins, mise for language runtimes and package managers.
- When adding or removing a managed config file, update both the symlink section in `setup.sh` and the file table in `readme.md`.
- When changing installed tools, keep `setup.sh`, `mise/config.toml`, and the README's tool lists consistent.
- Keep `setup.sh` safe to run repeatedly. Quote paths, retain `set -euo pipefail`, and check existing state before installation or deletion.
- Treat operations under `$HOME`, `/opt/homebrew`, and `~/Library/Application Support` as potentially destructive. Resolve and narrowly validate targets before removing or replacing anything.
- Preserve TPM initialization as the final line of `tmux.conf`.
- Preserve Zsh plugin ordering: completions first, autosuggestions/fzf-tab next, and syntax highlighting last among plugins.
- Follow the existing formatting style in each config file. Avoid unrelated reformatting or version bumps.
- Machine-specific absolute paths already exist in `zshrc`; do not add more unless the configuration is deliberately personal and the path is required.
- Never commit credentials, tokens, private keys, kubeconfigs, or contents from external files referenced by these configs.

## Validation

Run the checks relevant to the files changed:

```sh
bash -n setup.sh
zsh -n zshrc
mise config ls
```

For tmux changes, when tmux is installed:

```sh
tmux -L dotfiles-check -f "$PWD/tmux.conf" start-server
tmux -L dotfiles-check kill-server
```

For Ghostty changes, compare option names against:

```sh
ghostty +show-config --default --docs
```

Do not run `./setup.sh` merely as a syntax check: it installs packages, modifies user-level symlinks, may move an existing Ghostty config to a backup, and changes Homebrew directory permissions. Run it only when end-to-end installation is explicitly requested or when those effects are understood.

After any change, inspect `git diff --check` and `git diff`. Preserve unrelated worktree changes.

## Documentation and commits

- Update `readme.md` when installation behavior, dependencies, linked files, or user-facing commands change.
- Use short imperative commit subjects consistent with the repository history, optionally prefixed with a conventional type such as `fix:` or `add:`.
