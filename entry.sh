#!/bin/sh
~/steamcmd.sh +login anonymous +force_install_dir /home/$USER/server +app_update 222860 validate +quit
mv /home/$USER/srcds_run ./srcds_run
cp /home/$USER/linux32/steamclient.so /home/$USER/.steam/sdk32/steamclient.so

cp -r /data/addons/. /home/$USER/server/left4dead2/addons
cp -r /data/sm-plugins/. /home/$USER/server/left4dead2/addons/sourcemod/plugins
cp -r /data/sm-configs/. /home/$USER/server/left4dead2/addons/sourcemod/configs
cp -r /data/configs/. /home/$USER/server/left4dead2/cfg/


./srcds_run -game left4dead2 $@
