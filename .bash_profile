# Load .bashrc if this is an interactive shell
if [[ $- == *i* ]]; then
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
fi

