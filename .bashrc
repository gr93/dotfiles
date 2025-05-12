case $- in
    *i*) ;;       # if the "$-" contains 'i', do nothing (interactive shell)
      *) return;; # else, return (non-interactive shell, exit the script/function)
esac

HISTSIZE= 
HISTFILESIZE=

PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '
export PATH=/Users/gopalr/Library/Python/3.9/bin:/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:$PATH
export PATH=/opt/homebrew/bin/:$PATH
alias ft='python3 /Users/gopalr/frametest.py'
alias history="vim $HISTFILE"

export PATH=/home/gopalr/dev:$PATH
alias vi='nvim'
alias vim='nvim'
#alias nvim='nvim'
alias ls='ls -a --color=auto'
export BASH_SILENCE_DEPRECATION_WARNING=1
alias gsh='git status --show'
export PATH=/opt/vagrant/embedded/bin/:$PATH
export PATH=/home/gopalr/local/usr/bin:$PATH


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/ampcs.sh ] && source ~/ampcs.sh
eval "$(zoxide init bash)"

[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

function pushdotfiles() {
  current_dir=$(pwd)
  cd ~/dev/dotfiles
  git add .
  git commit -m "Update"
  git push
  cd $current_dir
}

source ~/ampcs.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/gopalr/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/gopalr/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
