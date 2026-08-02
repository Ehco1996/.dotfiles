# ── Environment ───────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export PATH="/Users/ehco/.bun/bin:$PATH"
# KUBECONFIG managed by kubie (per-shell isolation)
export SSHW_CONFIG_PATH="/Users/ehco/Google Drive/My Drive/sshw.yml"

if (( $+commands[brew] )); then
  HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix)}"
  export HOMEBREW_PREFIX
  export CFLAGS="-I$HOMEBREW_PREFIX/opt/openssl/include"
  export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl/lib"
fi

# ── History ───────────────────────────────────────────────────
# Replaces oh-my-zsh's lib/history.zsh (gone with omz). zsh's bare defaults
# are HISTSIZE=30 / SAVEHIST=0 — history is never written to disk, which also
# starves zsh-autosuggestions (its default strategy suggests from history).
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt extended_history       # record command timestamps in HISTFILE
setopt hist_expire_dups_first # trim duplicates first when HISTFILE overflows
setopt hist_ignore_dups       # skip recording a line identical to the previous one
setopt hist_ignore_space      # skip lines that start with a space
setopt hist_verify            # expand history (e.g. !!) onto the line, don't auto-run
setopt share_history          # share history live across concurrent sessions

# ── Completion ────────────────────────────────────────────────
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit


# ── Plugins (homebrew) ────────────────────────────────────────
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ── Dev tools ─────────────────────────────────────────────────
eval "$(mise activate zsh)"
export PATH="$PATH:$(go env GOPATH)/bin"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ── Prompt ────────────────────────────────────────────────────
eval "$(starship init zsh)"

if [ -n "$SSH_CONNECTION" ]; then
  autoload -Uz add-zsh-hook
  _set_ssh_title() { print -Pn "\e]0;[SSH] %m:%~\a" }
  add-zsh-hook precmd _set_ssh_title
fi

# ── Aliases ───────────────────────────────────────────────────
alias k="kubectl"
alias kc="kubie ctx"
alias kn="kubie ns"

# bind kubectl completion to k alias
compdef k=kubectl
alias weather="curl wttr.in"
alias t="tmux"
alias ta="tmux attach"

# ── pnpm ──────────────────────────────────────────────────────
export PNPM_HOME="/Users/ehco/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
