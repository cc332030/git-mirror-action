#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL $1 | sh -s -- $parameter"
}

curl_sh https://github.com/cc332030/linux/raw/master/script/init-ssh/init-ssh-pre.sh
curl_sh https://github.com/cc332030/linux/raw/master/script/init-ssh/init-ssh.sh

curl_sh https://github.com/cc332030/git/raw/master/script/mirror/linux/mirror-github.sh

if [ -n "$COMMAND" ]
then
  ${COMMAND} || true
fi
