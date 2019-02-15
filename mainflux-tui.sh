#!/usr/bin/env bash
MAIN_PATH="$(dirname "$(realpath "$0")")"
MAIN_APP="$MAIN_PATH/main.sh"

source $MAIN_PATH/lib/menu/home.sh
source $MAIN_PATH/lib/menu/users.sh

#########################
# main
#########################
function main () {
  home_menu $@
}

main $@