#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/root/valheim-server/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970


echo "Starting server PRESS CTRL-C to exit"

# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
/root/valheim-server/valheim_server.x86_64 -name "$SERVER_NAME" -port 2456 -world "$SERVER_WORLD" -password "$SERVER_PASSWORD"

export LD_LIBRARY_PATH=$templdpath
