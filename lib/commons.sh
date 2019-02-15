#!/usr/bin/env bash
# File: commons.sh
#########################
# echolog
#########################
function echolog () {
  local DATE_FORMAT="date +%Y-%m-%dT%T.%s%z";
  echo  "$($DATE_FORMAT) - "$@;
}

#########################
# send_all_to_log
#########################
function send_all_to_log() {
  ###################################
  # Con esto mandamos TODO al archivo de log $LOG_FILE
  ###################################
  exec 3>&1 4>&2
  trap 'exec 2>&4 1>&3' 0 1 2 3
  exec 1>$LOG_FILE 2>&1

}

###################################
# Con esto nos detenemos y reportamos en cuanto 
# haya un error (grax @NGiogetti)
###################################
function error_catcher(){
  # para utilizar esto es necesario usar trap
  # trap 'error_catcher $LINENO' ERR
    echolog  "Error en linea $1 | Exit code $?"
    exit $?
}
#########################
# set_tput_colors
#########################
function set_tput_colors() {
BG_BLUE="$(tput setab 4)"
BG_BLACK="$(tput setab 0)"
FG_GREEN="$(tput setaf 2)"
FG_WHITE="$(tput setaf 7)"
}

function get_parameters() {
   set_mainflux_url="--mainflux-url $(cat $MAIN_PATH/.env  | grep mainflux-url | cut -d'=' -f2)"
}

