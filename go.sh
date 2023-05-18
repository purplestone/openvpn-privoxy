#!/bin/bash
echo "exec go"
sh /usr/local/bin/init $1

openvpn --config /home/config.ovpn &

privoxy --no-daemon /etc/privoxy/config.proxy2


