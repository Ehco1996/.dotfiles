# dotfiles

My macOS development environment.

## What's included

| File              | Description            |
| ----------------- | ---------------------- |
| `zshrc`           | Zsh configuration      |
| `tmux.conf`       | Tmux configuration     |
| `startship.toml`  | Starship prompt config |
| `mise/config.toml`| Dev tools via mise     |

## Quick setup

```bash
git clone https://github.com/Ehco1996/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

`setup.sh` will:

1. Install [Homebrew](https://brew.sh) (if not present)
2. Install system tools via brew: zsh plugins, fzf, zoxide, starship, tmux, kubectl, kubectx, mise
3. Symlink all config files to `$HOME`
4. Install dev tools via [mise](https://github.com/jdx/mise): go, bun, uv, pnpm
5. Fix compinit directory permissions

## Tool management

- **Homebrew** — system-level tools: zsh plugins, fzf, zoxide, starship, tmux, kubectl, kubectx
- **mise** — language runtimes & package managers: go, bun, uv, pnpm
