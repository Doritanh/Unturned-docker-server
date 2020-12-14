FROM cm2network/steamcmd

USER root
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mono-runtime -y

WORKDIR /home/steam/steamcmd
RUN ./steamcmd.sh \
    +login anonymous \
    +@sSteamCmdForcePlatformType linux \
    +force_install_dir /home/steam/unturned \
    +app_update 1110390 validate \
    +quit 

WORKDIR /home/steam/unturned

EXPOSE 27015/tcp 27015/udp
EXPOSE 27016/tcp 27016/udp
EXPOSE 27017/tcp 27017/udp

CMD [ "./ExampleServer.sh" ]