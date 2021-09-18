# systemd
System and service manager

systemctl is the main command in systemd, used to control services

Reference,
- https://www.shellhacks.com/systemd-service-file-example/

## Configuration
Steps,
- Create a systemd service file /etc/systemd/system/helloworld-daemon.service and add right permissions
- Reload init daemons information

```js
%> cat /etc/systemd/system/helloworld-daemon.service
[Unit]
Description=helloworld nodejs app

[Service]
ExecStart=/usr/bin/node /usr/local/helloworld/helloworld.js

[Install]
WantedBy=multi-user.target

%> sudo chmod 664 /etc/systemd/system/helloworld-daemon.service
%> sudo systemctl daemon-reload
```