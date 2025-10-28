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
# History configuration
export HISTSIZE=-1
export HISTFILESIZE=-1
shopt -s histappend

# Save and reload history after each command
PROMPT_COMMAND='history -a; history -n; history -r;'

# =========================================================
# Prompt
# =========================================================
PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '

# =========================================================
# PATH setup
# =========================================================
export PATH="/Users/gopalr/Library/Python/3.9/bin:/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin"
export PATH="/opt/homebrew/bin:/opt/vagrant/embedded/bin:/home/gopalr/local/usr/bin:/home/gopalr/dev:$PATH"

# =========================================================
# Aliases
# =========================================================
alias vim='nvim'
alias ls='ls -a --color=auto'
alias lg='lazygit'
alias ft='python3 /Users/gopalr/frametest.py'
alias bat="bat -p"
if command -v bat &>/dev/null; then
  alias cat="bat"
fi

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
function pushdotfiles() {
  local current_dir
  current_dir=$(pwd)
  cd ~/dev/dotfiles || return
  git add .
  git commit -m "Update"
  git push
  cd "$current_dir" || return
}

# =========================================================
# Optional sources
# =========================================================
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# =========================================================
# Homebrew (Linuxbrew)
# =========================================================
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# =========================================================
# Micromamba
# =========================================================
export MAMBA_EXE='/home/gopalr/.local/bin/micromamba'
export MAMBA_ROOT_PREFIX='/home/gopalr/micromamba'

__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__mamba_setup"
else
  alias micromamba="$MAMBA_EXE"  # fallback
fi
unset __mamba_setup

micromamba activate tools

# =========================================================
# zoxide
# =========================================================
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

