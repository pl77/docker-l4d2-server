#!/bin/sh
~/steamcmd.sh +login anonymous +force_install_dir ./csgo +app_update 740 validate +quit \
   && cp /home/$USER/linux32/steamclient.so /home/$USER/.steam/sdk32/steamclient.so
./srcds_run -game csgo -tickrate 128 -autoupdate -steam_dir ~/ -steamcmd_script csgo_ds.txt $@
