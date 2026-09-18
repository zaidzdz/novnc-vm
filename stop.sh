#!/usr/bin/env bash

set -u

pkill -u "$(id -u)" -x chrome 2>/dev/null || true
pkill -u "$(id -u)" -x openbox 2>/dev/null || true
pkill -u "$(id -u)" -f 'websockify.*6080.*localhost:5901' 2>/dev/null || true
vncserver -kill :1 2>/dev/null || true
