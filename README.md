# OpenVPN & Privoxy for Docker
openvpn-privoxy is a docker image.

There are OpenVPN server & Privoxy proxy server in it.

Docker image base from: [kylemanna/openvpn](https://hub.docker.com/r/kylemanna/openvpn)

Privoxy from yum.

## Quick Start

```bash
docker run --rm -it --cap-add NET_ADMIN --name ovp -p 8118:8118 -v /loc/dir/path/config.ovpn:/home/config.ovpn purplestone/openvpn-privoxy none


docker run -d --restart always --cap-add NET_ADMIN --dns=8.8.8.8 --name ovp -p 8118:8118 -v /loc/dir/path/config.ovpn:/home/config.ovpn purplestone/openvpn-privoxy:1.2.3.1 192.168.255.22:3128
```

## API

cmd => remote proxy address:
* none => ( docker net )
* (null) => 172.17.0.1:8118
* ip:port => ( ip:port )

```docker run -d --cap-add NET_ADMIN -p 【开启本地代理服务端口】:8118 -v 【连接openvpn的配置文件.ovpn】:/home/config.ovpn purplestone/openvpn-privoxy 【访问开启的本地代理服务会转发到此代理服务器】```

Dockerfile code: [Git hub]([https://link](https://github.com/purplestone/openvpn-privoxy))

## Version List
purplestone/openvpn-privoxy
* v1.2.3.1 : OpenVPN 2.4.9 & Privoxy 3.0.33

