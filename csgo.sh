#!/bin/sh
if [[ ! -f "./srcds_linux" ]]; then
    ~/steamcmd.sh +login anonymous +force_install_dir /home/$USER/server +app_update 740 validate +quit
    mv /home/$USER/srcds_run ./srcds_run
    cp /home/$USER/linux32/steamclient.so /home/$USER/.steam/sdk32/steamclient.so
fi
   ./srcds_run -game csgo -tickrate 128 -autoupdate -steam_dir ~/ -steamcmd_script ~/server/csgo_ds.txt $@
