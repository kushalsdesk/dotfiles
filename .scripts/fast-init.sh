os_name=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '\"')                                         
kernel=$(uname -r)
uptime=$(uptime -p)
shell_name=$(echo "${SHELL##*/}")


function display_system_info {
    printf " 💽 : ${os_name}   "
    printf "  🐧: ${kernel} 󰌽  "
    printf "  ⏳: ${uptime} 󰔚  "
    printf "  🐚: ${shell_name}   "
    echo   "  🖥️ : $XDG_CURRENT_DESKTOP "
}

# Call the function
display_system_info

