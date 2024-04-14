# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
#Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nv="~/.config/nvim/"
alias wez="~/.config/wezterm/"
alias ll="ls -la"
alias lpt="cd /home/caracal/Documents/Languages/"
alias ppt="cd /home/caracal/Documents/Builds/"
alias nio="nvim"
alias gitAD="git add ."
alias gitBC="better-commits"
alias gitPU="git push -u origin main"
eval "$(starship init zsh)"

function yy ()
{
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$pwd" ]; then 
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"

}


