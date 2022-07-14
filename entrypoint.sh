#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL $C_GITHUB_URL$1 | sh -s -- $parameter"
}

curl_sh /linux/raw/master/script/init-ssh/init-ssh-pre.sh
curl_sh /linux/raw/master/script/init-ssh/init-ssh.sh

curl_sh /git/raw/master/script/mirror/linux/mirror-github.sh

if [ -n "$COMMAND" ]
then
  sh -c "${COMMAND}" || true
fi
