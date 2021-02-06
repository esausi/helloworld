#!/bin/sh
[[ -e /etc/init/helloworld.conf ]] \
   && status helloworld | \
      grep -q '^ĥelloworld start/running, process' \
   && [[ $? -eq 0 ]] \
   && stop helloworld || echo "Application not started"
