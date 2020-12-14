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
CMD [ "./Unturned_Headless.x86_64" ]

EXPOSE 27015