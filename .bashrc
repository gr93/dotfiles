case $- in
    *i*) ;;       # if the "$-" contains 'i', do nothing (interactive shell)
      *) return;; # else, return (non-interactive shell, exit the script/function)
esac

PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '
export PATH=/Users/gopalr/Library/Python/3.9/bin:/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:$PATH
export PATH=/opt/homebrew/bin/:$PATH
alias ft='python3 /Users/gopalr/frametest.py'
export RUBY_VERSION=$(rbenv global)
alias python=/opt/homebrew/bin/python3.10
alias python3=/opt/homebrew/bin/python3.10
alias pip='python3 -m pip'
alias pip3='python3 -m pip'

export PATH=/home/gopalr/dev:$PATH
alias vi='nvim.appimage'
alias vim='nvim.appimage'
alias nvim='nvim.appimage'
alias ls='ls -a --color=auto'
export BASH_SILENCE_DEPRECATION_WARNING=1
alias gsh='git status --show'
export PATH=/opt/vagrant/embedded/bin/:$PATH


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
