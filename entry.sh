#!/bin/sh
cp -r /data/addons/. /home/$USER/server/left4dead2/addons
cp -r /data/sm-plugins/. /home/$USER/server/left4dead2/addons/sourcemod/plugins
cp -r /data/sm-configs/. /home/$USER/server/left4dead2/addons/sourcemod/configs
cp -r /data/configs/. /home/$USER/server/left4dead2/cfg/
./srcds_run -game left4dead2 $@
