#!/usr/bin/env bash

cd /opt/dubhacks-2016
nohup coffee src/server/server.coffee > /var/log/dubhacks-2016.log 2>&1&
echo $! > /var/run/dubhacks-2016.pid
