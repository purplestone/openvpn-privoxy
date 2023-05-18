FROM kylemanna/openvpn


USER root
EXPOSE 8118
# ADD ./apk-alimirror.conf /etc/apk/repositories
RUN apk add privoxy curl

COPY ./init.sh /usr/local/bin/init
COPY ./go.sh /usr/local/bin/go

WORKDIR /etc/privoxy/
RUN cp default.filter.new default.filter
RUN cp user.filter.new user.filter
RUN cp user.action.new user.action
RUN cp default.action.new default.action
RUN cp config.new config
RUN cp match-all.action.new match-all.action
RUN echo forward / %%FORWARD_REMOTE_URL%% >> config


ENTRYPOINT ["go"]
CMD ["192.168.255.22:3128"]


# docker build -t purplestone/openvpn-privoxy:1.2.3.1 .
# docker run --rm -it --cap-add NET_ADMIN --dns=8.8.8.8 --name ovp -p 8118:8118 -v D:/dl/vpnsub/bb-server.ovpn:/home/config.ovpn purplestone/openvpn-privoxy:1.2.3.1 192.168.255.22:8118