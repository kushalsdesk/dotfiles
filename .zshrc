# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
plugins=( git sudo  zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh


# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Previous aliases
alias h.="helix ."
alias hx="helix"
alias fh="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 helix "
alias wez="~/.config/wezterm/"
alias lpt="cd /home/caracal/Documents/Languages/"
alias nvpt="cd /home/caracal/.dotfiles/.config/nvim"
alias ppt="cd /home/caracal/Documents/Builds/"
alias ypt="cd /home/caracal/.config/yazi/"
alias nio="nvim"
alias gadd="git add ."
alias gcom="better-commits"
alias gpush="git push -u origin main"
alias naut="nautilus ."
# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'




#Customized aliases for flutter .
alias flutAndroid="flutter emulators --launch android_normal && flutter run"
alias flutDesktop="flutter run -d linux"


function yy ()
{
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$pwd" ]; then 
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"

}

#Function for compiling the JavaFile
compile() {
  echo "Enter Package Name:"
  read -r package_name

  echo "Enter Class Name:"
  read -r class_name

  source_file="src/$package_name/$class_name.java" 

  #Checks if sourceFile exists
  if [ ! -f "$source_file" ]; then
    echo "Error: File '$source_file' does not exist!"
    return 1
  fi

  #Create output directory if not created
  out_dir="out"
  mkdir -p "$out_dir"

  javac -d "$out_dir" "$source_file"
  
  # Check for compilation errors
  if [ $? -ne 0 ]; then
    echo "Compilation failed for '$class_name'"
  else
    echo "Successfully compiled '$class_name' to '$out_dir'"
  fi
}


#For Running the java Class
run () {
  echo "Enter Package Name:"
  read -r package_name

  echo "Enter Class Name:"
  read -r class_name
  
  # Class file path
  class_file="out/$package_name/$class_name.class"

  # Check if class file exists
  if [ ! -f "$class_file" ]; then
    echo "Error: Class file '$class_file' not found!"
    return 1
  fi

  # Execute the class file with java command
  java -cp "out" "$package_name.$class_name"

  # Check for execution errors
  if [ $? -ne 0 ]; then
    echo "Error: Failed to run '$class_name'"
  fi

}


export PATH="$PATH:/usr/bin"
export PATH="/usr/local/bin:$PATH"

# bun completions
[ -s "/home/caracal/.bun/_bun" ] && source "/home/caracal/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# android emulator 
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH

PATH=~/.console-ninja/.bin:$PATH
export ENCORE_INSTALL="/home/caracal/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export PATH=$HOME/.local/bin:$PATH
alias ff='fastfetch'
alias nn='nvim'
. "/home/caracal/.deno/env"