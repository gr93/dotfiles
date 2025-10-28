# =========================================================
# Interactive shell guard
# =========================================================
case $- in
  *i*) ;;       # interactive shell
  *) return ;;  # non-interactive shell
esac

# =========================================================
# History
# =========================================================
export HISTSIZE=-1
export HISTFILESIZE=-1
shopt -s histappend
PROMPT_COMMAND='history -a; history -n; history -r;'

# =========================================================
# Prompt
# =========================================================
PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '

# =========================================================
# PATH setup
# =========================================================
# Prepend custom bins first
export PATH="$HOME/dev:$HOME/local/usr/bin:/opt/homebrew/bin:/opt/vagrant/embedded/bin:$PATH"
# Append standard system bins to ensure commands like ls/cat exist
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin"

# =========================================================
# Aliases
# =========================================================
alias vim='nvim'
alias ls='ls -a --color=auto'
alias lg='lazygit'
alias ft='python3 $HOME/frametest.py'
alias bat='bat -p'
if command -v bat &>/dev/null; then
  alias cat='bat'
fi
alias g++='g++ -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion'

# =========================================================
# Environment tweaks
# =========================================================
export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export INPUTRC="$HOME/.inputrc"

# =========================================================
# Dotfiles helper
# =========================================================
pushdotfiles() {
  local current_dir
  current_dir=$(pwd)
  cd "$HOME/dev/dotfiles" || return
  git add .
  git commit -m "Update"
  git push
  cd "$current_dir" || return
}

# =========================================================
# Optional sources
# =========================================================
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# =========================================================
# Homebrew (Linuxbrew)
# =========================================================
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# =========================================================
# Micromamba
# =========================================================
export MAMBA_EXE="$HOME/.local/bin/micromamba"
export MAMBA_ROOT_PREFIX="$HOME/micromamba"

if [ -x "$MAMBA_EXE" ]; then
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias micromamba="$MAMBA_EXE"  # fallback
    fi
    unset __mamba_setup

    micromamba activate tools

    # Ensure system binaries still in PATH after micromamba
    export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin"
fi

# =========================================================
# zoxide
# =========================================================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

