#!/bin/sh

[[ -e /etc/init/helloworld.conf ]] \
   && systemctl status helloworld | \
      grep -q '^active (running)' \
   && [[ $? -eq 0 ]] \
   && stop helloworld || echo "Application not started"
