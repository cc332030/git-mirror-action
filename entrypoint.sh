#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL https://github.com/cc332030$1 | sh -s -- $parameter"
}

curl_sh /linux/raw/master/script/init-ssh/init-ssh-pre.sh
curl_sh /linux/raw/master/script/init-ssh/init-ssh.sh

curl_sh /git/raw/master/script/mirror/linux/mirror-github.sh

if [ -n "$COMMAND" ]
then
  ${COMMAND} || true
fi
