# ── Environment ───────────────────────────────────────────────
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export KUBECONFIG="$HOME/.kube/config"
export SSHW_CONFIG_PATH="/Users/ehco/Google\ Drive/My\ Drive/sshw.yml"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"

# ── Claude Code ───────────────────────────────────────────────
export CLAUDE_CODE_NO_FLICKER=1
export CLAUDE_CODE_AUTO_COMPACT_WINDOW=400000

_claude_ssh_wrap() {
    if [ -n "$SSH_CONNECTION" ] && [ -z "$KEYCHAIN_UNLOCKED" ]; then
      security unlock-keychain ~/Library/Keychains/login.keychain-db
      export KEYCHAIN_UNLOCKED=true
    fi
    if [ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ]; then
      if tmux has-session -t claude 2>/dev/null; then
        tmux attach-session -t claude
      else
        tmux new-session -d -s claude
        tmux send-keys -t claude "$*" Enter
        tmux attach-session -t claude
      fi
    else
      eval "$@"
    fi
}

claude() { _claude_ssh_wrap "command claude $*"; }
c() { _claude_ssh_wrap "command claude --dangerously-skip-permissions $*"; }


# ── Completion ────────────────────────────────────────────────
autoload -Uz compinit
compinit

[ -f /Users/ehco/.claude/hooks/peon-ping/completions.bash ] && source /Users/ehco/.claude/hooks/peon-ping/completions.bash

# ── Plugins (homebrew) ────────────────────────────────────────
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Dev tools ─────────────────────────────────────────────────
eval "$(mise activate zsh)"
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
alias kc="kubectx"
alias weather="curl wttr.in"
alias t="tmux"
alias ta="tmux attach"

# ── pnpm ──────────────────────────────────────────────────────
export PNPM_HOME="/Users/ehco/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
