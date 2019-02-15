# File: get_mainflux_server_version.sh
#########################
# get_mainflux_server_version
########################
function get_mainflux_server_version() {
  get_parameters
  local mainflux_server_version=$(mainflux-cli $set_mainflux_url version)
      
  echo "Mainflux Server Version: $mainflux_server_version"
}
