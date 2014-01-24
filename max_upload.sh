#!/bin/bash

MY_APP_ID="RaspHomCenter.app"
MY_APP_TOKEN="GhTmv6Mgaid4r+iZWnO+7Ox/qEfFZOIkLf1TlT9TD0GdmmHz8nK/uXz87HvCpv+j"

# source the freeboxos-bash-api
source ./freeboxos_bash_api.sh

# login
login_freebox "$MY_APP_ID" "$MY_APP_TOKEN"

# get xDSL data
answer=$(call_freebox_api '/connection/xdsl')

# get result values
result=$(get_json_value_for_key "$answer" 'result')

# get upload xDSL data from xDSL data
up_xdsl=$(get_json_value_for_key "$result" 'up')

# get up max xDSL rate from upload xDSL data
up_max_rate=$(get_json_value_for_key "$up_xdsl" 'maxrate')

echo "Max Upload xDSL rate: $up_max_rate kbit/s"
