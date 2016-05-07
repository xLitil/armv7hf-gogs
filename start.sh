#!/bin/bash

chown -R git:git .
chown -R git:git /data

exec su git -c "./gogs web"
