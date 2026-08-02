#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

info() { printf "\033[1;34m[INFO]\033[0m %s\n" "$1"; }
ok()   { printf "\033[1;32m[ OK ]\033[0m %s\n" "$1"; }
err()  { printf "\033[1;31m[ERR ]\033[0m %s\n" "$1"; }

# ── Homebrew ──────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
  ok "Homebrew installed"
else
  ok "Homebrew already installed"
fi
BREW_PREFIX="$(brew --prefix)"

# ── Brew packages ────────────────────────────────────────────
BREW_PACKAGES=(
  # zsh plugins
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
  fzf
  # dev tools
  mise
  zoxide
  starship
  tmux
  # k8s
  kubectl
  kubie
)

info "Installing brew packages..."
install_failed=0
for pkg in "${BREW_PACKAGES[@]}"; do
  if command -v "$pkg" &>/dev/null || brew list "$pkg" &>/dev/null; then
    ok "$pkg already installed"
  else
    info "Installing $pkg..."
    if brew install "$pkg"; then
      ok "$pkg installed"
    else
      err "Failed to install $pkg"
      install_failed=1
    fi
  fi
done
if [ "$install_failed" -ne 0 ]; then
  err "One or more Homebrew packages failed to install"
  exit 1
fi

# ── Tmux Plugin Manager ──────────────────────────────────────
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -x "$TPM_DIR/tpm" ]; then
  ok "TPM already installed"
elif [ -e "$TPM_DIR" ]; then
  err "$TPM_DIR exists but is not a valid TPM installation"
  exit 1
else
  info "Installing TPM..."
  mkdir -p "$(dirname "$TPM_DIR")"
  if git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"; then
    ok "TPM installed"
  else
    err "Failed to install TPM"
    exit 1
  fi
fi

# ── Symlinks ─────────────────────────────────────────────────
link_file() {
  local src="$1" target="$2"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
    ok "$target already linked"
  else
    ln -sf "$src" "$target"
    ok "$target -> $src"
  fi
}

info "Creating symlinks..."
mkdir -p "$HOME/.config/mise"
mkdir -p "$HOME/.config/ghostty"
# Ghostty on macOS prefers ~/Library/Application Support path over XDG;
# back up any existing config there so the XDG symlink takes effect.
GHOSTTY_MACOS_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
if [ -d "$GHOSTTY_MACOS_DIR" ] && [ -f "$GHOSTTY_MACOS_DIR/config" ] && [ ! -L "$GHOSTTY_MACOS_DIR/config" ]; then
  GHOSTTY_BACKUP="$GHOSTTY_MACOS_DIR/config.backup.$(date +%Y%m%d%H%M%S)"
  mv "$GHOSTTY_MACOS_DIR/config" "$GHOSTTY_BACKUP"
  ok "Backed up existing Ghostty config to $GHOSTTY_BACKUP"
fi
link_file "$DOTFILES_DIR/zshrc"           "$HOME/.zshrc"
link_file "$DOTFILES_DIR/tmux.conf"       "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/starship.toml"   "$HOME/.config/starship.toml"
link_file "$DOTFILES_DIR/mise/config.toml" "$HOME/.config/mise/config.toml"
link_file "$DOTFILES_DIR/ghostty.conf"    "$HOME/.config/ghostty/config"

info "Installing tmux plugins..."
if "$TPM_DIR/bin/install_plugins"; then
  ok "tmux plugins installed"
else
  err "Failed to install tmux plugins"
  exit 1
fi

# ── Mise: install dev tools ──────────────────────────────────
info "Installing mise-managed tools (bun, go, node, uv, pnpm)..."
mise trust "$DOTFILES_DIR" 2>/dev/null
if mise install --yes; then
  ok "mise tools installed"
else
  err "Failed to install mise tools"
  exit 1
fi

# ── Peon-ping (RA2 Soviet Engineer notifications) ────────────
# if command -v peon &>/dev/null; then
#   ok "peon-ping already installed"
# else
#   info "Installing peon-ping..."
#   brew tap PeonPing/tap && brew install peon-ping && ok "peon-ping installed" || err "Failed to install peon-ping"
# fi
# info "Setting up peon-ping with ra2_soviet_engineer pack..."
# peon-ping-setup --packs=ra2_soviet_engineer 2>/dev/null && ok "peon-ping configured" || err "peon-ping setup failed"
# peon packs use ra2_soviet_engineer 2>/dev/null && ok "Active pack: ra2_soviet_engineer" || true

# ── Fix compinit permissions ─────────────────────────────────
if [ -d "$BREW_PREFIX/share/zsh" ]; then
  chmod 755 "$BREW_PREFIX/share/zsh" "$BREW_PREFIX/share/zsh/site-functions" 2>/dev/null
  ok "Fixed compinit directory permissions"
fi

# ── Done ─────────────────────────────────────────────────────
printf "\n\033[1;32mAll done! Restart your terminal to apply changes.\033[0m\n"
