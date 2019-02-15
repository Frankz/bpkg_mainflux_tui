# File: home.sh
#########################
# home_menu
#########################
function home_menu() {

# tput_menu: a menu driven system information program
set_tput_colors
# Save screen
tput smcup

# Display menu until selection == 0
while [[ $REPLY != 0 ]]; do
echo -n ${BG_BLUE}${FG_WHITE}
clear
cat <<- _EOF_
  Please Select:

  1. Channels management
  2. Help about any command
  3. Send or read messages
  4. Provision things and channels from config file
  5. Things management
  6. Users management
  7. Mainflux services version
  0. Quit

_EOF_

read -p "Enter selection [0-7] > " selection

# Clear area beneath menu
tput cup 10 0
echo -n ${BG_BLACK}${FG_GREEN}
tput ed
tput cup 11 0

# Act on selection
case $selection in
  1)  
      echo "Mainflux channels"
      mainflux-cli channels help
      ;;
  2)  
      df -h
      ;;
  3)  
      if [[ $(id -u) -eq 0 ]]; then
        echo "Home Space Utilization (All Users)"
        du -sh /home/* 2> /dev/null
      else
        echo "Home Space Utilization ($USER)"
        du -s $HOME/* 2> /dev/null | sort -nr
      fi
      ;;
  6)  
      users_menu
      #break
      ;;
  7)  
      get_mainflux_server_version
      ;;
  0)  
      break
      ;;
  *)  
      echo "Invalid entry."
      ;;
esac
printf "\n\nPress any key to continue."
read -n 1
done

# Restore screen
tput rmcup
echo "Program terminated."
}
