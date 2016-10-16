
#!/usr/bin/env bash

PID_FILE="/var/run/dubhacks-2016.pid"
if [[ -e ${PID_FILE} ]]; then
	kill -9 $(cat ${PID_FILE}) || true
fi
