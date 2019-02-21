# File: get_mainflux_users.sh
#########################
# get_mainflux_users_create
########################
function get_mainflux_users_create() {
  get_parameters
  local mainflux_server_version=$(mainflux-cli $set_mainflux_url version)
      
  echo "Mainflux Server Version: $mainflux_server_version"
}
#########################
# get_mainflux_users_token
########################
function get_mainflux_users_token() {
  get_parameters
  local mainflux_server_version=$(mainflux-cli $set_mainflux_url version)
      
  echo "Mainflux Server Version: $mainflux_server_version"
}

