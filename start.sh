#!/bin/bash

chown -R git:git .

exec su git -c "./gogs web"
