FROM steamcmd/steamcmd:ubuntu

WORKDIR /root

RUN /root/.steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /root/valheim-server +app_update 896660 +quit

COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 2456-2458/tcp
EXPOSE 2456-2458/udp
