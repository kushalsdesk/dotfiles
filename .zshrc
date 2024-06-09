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
