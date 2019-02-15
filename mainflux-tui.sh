#!/usr/bin/env bash
# File: mainflux-tui.sh
# bpkg with tput menu for mainflux-cli

MAIN_PATH="$(dirname "$(realpath "$0")")"
MAIN_APP="$MAIN_PATH/mainflux-tui.sh"

# Para tener en cuenta
# https://stackoverflow.com/questions/1423352/source-all-files-in-a-directory-from-bash-profile
# for file in "$(find . -maxdepth 1 -name '*.sh' -print -quit)"; do source $file; done
source $MAIN_PATH/lib/commons.sh
source $MAIN_PATH/lib/command/get_mainflux_server_version.sh
source $MAIN_PATH/lib/menu/home.sh
source $MAIN_PATH/lib/menu/users.sh

#trap 'error_catcher $LINENO' ERR
#########################
# main
#########################
function main () {
  home_menu $@
}

main $@