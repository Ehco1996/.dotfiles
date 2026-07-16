# ── Environment ───────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
# KUBECONFIG managed by kubie (per-shell isolation)
export SSHW_CONFIG_PATH="/Users/ehco/Google Drive/My Drive/sshw.yml"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"

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

# ── Claude Code ───────────────────────────────────────────────
#export CLAUDE_CODE_NO_FLICKER=1
#export CLAUDE_CODE_AUTO_COMPACT_WINDOW=400000

_claude_ssh_wrap() {
    if [ -n "$SSH_CONNECTION" ] && [ -z "$KEYCHAIN_UNLOCKED" ]; then
      security unlock-keychain ~/Library/Keychains/login.keychain-db
      export KEYCHAIN_UNLOCKED=true
    fi
    if [ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ]; then
      # sentinel: v5-dirname-A — verify with `type _claude_ssh_wrap`
      # Session name = current directory basename. -A attaches if a session
      # with that name already exists, else creates one. -i forces interactive
      # zsh so .zshrc loads (PATH etc). exec $shell -i keeps the window alive
      # after the command exits.
      local session_name shell
      session_name="$(basename "$PWD")"
      shell="${SHELL:-/bin/zsh}"
      tmux new-session -A -s "$session_name" -c "$PWD" "$shell" -ic "$*; exec $shell -i"
    else
      eval "$@"
    fi
}

claude() { _claude_ssh_wrap "command claude $*"; }
c() { _claude_ssh_wrap "command claude --dangerously-skip-permissions $*"; }


# ── Completion ────────────────────────────────────────────────
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit


# ── Plugins (homebrew) ────────────────────────────────────────
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
