#!/usr/bin/env bash

set -u

pkill -u "$(id -u)" -x dillo 2>/dev/null || true
pkill -u "$(id -u)" -f 'websockify.*6080.*localhost:5901' 2>/dev/null || true
vncserver -kill :1 2>/dev/null || true

printf '%s\n' 'noVNC, Dillo, and VNC display :1 stopped.'