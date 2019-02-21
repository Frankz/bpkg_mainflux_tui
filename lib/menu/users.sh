# File: users.sh
#########################
# users_menu
#########################
function users_menu() {

# tput_menu: a menu driven system information program
set_tput_colors

# Save screen
tput smcup

# Display menu until selection == 0
while [[ $REPLY != 0 ]]; do
echo -n ${BG_BLUE}${FG_WHITE}
clear
#mainflux-cli users help
cat <<- _EOF_
# Mainflux users
  Please Select:

  1. Create
  2. Token
  3. Home
  0. Quit

_EOF_

read -p "Enter selection [0-3] > " selection

# Clear area beneath menu
tput cup 10 0
echo -n ${BG_BLACK}${FG_GREEN}
tput ed
tput cup 11 0

# Act on selection
case $selection in
  1)  
      echo "Do something with create..."
      read -p "user > " user 
      read -s -p "password > " pass
      local mainflux_users_create=$(mainflux-cli $set_mainflux_url users create $user $pass)
      
  echo "$mainflux_users_create"
  sleep 3
      ;;
  2)  
      #echo "Do something with token..."
      read 
      ;;
  3)  
      echo "Back to Home"
      home_menu
      ;;
  0)  
      tput rmcup
      echo "Program terminated."
      exit
      ;;
  *)  
      echo "Invalid entry."
      ;;
esac
printf "\n\nPress any key to continue."
read -n 1
done

# Restore screen
#tput rmcup
#echo "Program terminated."
}
