FROM debian:buster-slim
LABEL maintainer="me@jackz.me"

ENV USER steam
ENV SERVER /home/$USER/server
# $SERVER will contain root dir (aka for csgo, ~/server/csgo/addons)
# steamcmd stored in /home/$USER

RUN set -x \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install  --no-install-recommends --no-install-suggests lib32gcc1 curl net-tools lib32stdc++6 ca-certificates \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -m $USER  \
    && mkdir -p $SERVER

COPY ./csgo_ds.txt $SERVER/csgo_ds.txt
COPY ./autoexec.cfg $SERVER/csgo/cfg/autoexec.cfg
COPY ./server.cfg $SERVER/csgo/cfg/server.cfg

RUN chown -R $USER:$USER $SERVER && chmod +x /home/$USER -R
USER $USER


RUN curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -C /home/$USER -xz \
    && mkdir -p /home/$USER/.steam/sdk32
RUN curl https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git971-linux.tar.gz | tar -C $SERVER/csgo/ -xz \
    && curl https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6460-linux.tar.gz | tar -C $SERVER/csgo/ -xz 
COPY ./srcds_run /home/$USER/srcds_run
# srcds cant find steamclient.so, copy it locally && srcds_run has incorrect autorestart executable (uses steam.sh instead of steamcmd.sh)

EXPOSE 27015/udp
VOLUME $SERVER/csgo/addons $SERVER/csgo/cfg $SERVER 

COPY ./csgo.sh $SERVER/csgo.sh
WORKDIR $SERVER
ENTRYPOINT ["./csgo.sh","-game csgo"]
CMD ["-console" "-usercon" "+game_type" "0" "+game_mode" "1" "+mapgroup" "mg_active" "+map" "de_cache"]
