#!/bin/sh
~/steamcmd.sh +login anonymous +force_install_dir /home/$USER/server +app_update 222860 +quit
mv /home/$USER/srcds_run ./srcds_run
cp /home/$USER/linux32/steamclient.so /home/$USER/.steam/sdk32/steamclient.so
./srcds_run -game left4dead2 $@
