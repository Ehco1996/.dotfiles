# dotfiles

My macOS development environment.

## What's included

| File              | Description            |
| ----------------- | ---------------------- |
| `zshrc`           | Zsh configuration      |
| `tmux.conf`       | Tmux configuration     |
| `starship.toml`   | Starship prompt config |
| `ghostty.conf`    | Ghostty configuration  |
| `mise/config.toml`| Dev tools via mise     |

## Quick setup

```bash
git clone https://github.com/Ehco1996/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

`setup.sh` will:

1. Install [Homebrew](https://brew.sh) (if not present)
2. Install system tools via brew: zsh plugins, fzf, zoxide, starship, tmux, kubectl, kubie, mise
3. Install TPM for tmux plugins
4. Symlink all config files to `$HOME`
5. Install dev tools via [mise](https://github.com/jdx/mise): bun, go, node, uv, pnpm
6. Fix compinit directory permissions

## Tool management

- **Homebrew** — system-level tools: zsh plugins, fzf, zoxide, starship, tmux, kubectl, kubie, mise
- **mise** — language runtimes & package managers: bun, go, node, uv, pnpm
