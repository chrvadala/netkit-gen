#!/bin/sh

cat <<EOF
*************************************************
* Autore: Work Out Web http://www.workoutweb.it *
*************************************************
EOF

echo -n "Nome macchina [es. router1]: "
read NAME

echo -n "Numero interfaccia di rete [es. 0]: "
read INT_NUM

echo -n "Dominio di collisione [es. A]: "
read DOMAIN

echo -n "Numero ip [es. 10.0.0.1]: "
read IP

echo -n "Lunghezza Subnet [es. 24]: "
read SUB_LEN

IFCONFIG=`printf "ifconfig eth%d %s/%d UP" "$INT_NUM" "$IP" "$SUB_LEN"`
LINK=`printf "%s[%d]=%s" "$NAME" "$INT_NUM" "$DOMAIN"`
STARTUP=`printf "%s.startup" $NAME`

echo '**********************************'
echo "Directory"
mkdir -vp $NAME
echo

echo "APPEND -> lab.conf"
echo $LINK | tee -a lab.conf | cat
echo

echo "APPEND ->" $STARTUP
echo $IFCONFIG | tee -a $STARTUP | cat

echo "DONE\n"

