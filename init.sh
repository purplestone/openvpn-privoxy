echo "exec init" $1

mkdir /dev/net -pv
mknod /dev/net/tun c 10 200
chmod 666 /dev/net/tun


REPLACE_TARGET="%%FORWARD_REMOTE_URL%%"
if [ -z "$1" ]
then
    REMOTE_URL='172.17.0.1:8118'
elif [ "$1" = "none" ]
then
	REPLACE_TARGET="forward \/ %%FORWARD_REMOTE_URL%%"
	REMOTE_URL="#"
else
	REMOTE_URL="$1"
fi


sed "s/$REPLACE_TARGET/$REMOTE_URL/g" /etc/privoxy/config > /etc/privoxy/config.proxy
nohup sed "s/listen-address  127.0.0.1:8118/listen-address  0.0.0.0:8118/g" /etc/privoxy/config.proxy > /etc/privoxy/config.proxy2
echo "REMOTE: "$REMOTE_URL
echo "loc port:8118"

