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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git sudo  zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


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
alias hx="helix ."
alias wez="~/.config/wezterm/"
alias ll="ls -la"
alias lpt="cd /home/caracal/Documents/Languages/"
alias ppt="cd /home/caracal/Documents/Builds/"
alias ypt="cd /home/caracal/.config/yazi/"
alias code="snap run code ."
alias nio="nvim"
alias gadd="git add ."
alias gcom="better-commits"
alias gpush="git push -u origin main"
alias astudio="/home/caracal/android-studio/bin/studio.sh"
alias naut="nautilus ."
eval "$(starship init zsh)"




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

export PATH="$PATH:/home/caracal/flutter/bin"
export PATH="$PATH:/home/caracal/Android/Sdk"

export PATH="$PATH:/usr/bin"
# bun completions
[ -s "/home/caracal/.bun/_bun" ] && source "/home/caracal/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PATH=~/.console-ninja/.bin:$PATH

source ~/.dotfiles/scripts/fast-init.sh

