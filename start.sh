#!/usr/bin/env bash

set -euo pipefail

if ! vncserver -list | grep -qE '^\s*1\s+5901\s+'; then
	vncserver :1 -localhost yes -SecurityTypes None -geometry "${VNC_GEOMETRY:-1280x800}"
fi

if ! pgrep -u "$(id -u)" -x dillo >/dev/null; then
	DISPLAY=:1 dillo >/tmp/dillo.log 2>&1 &
fi

exec websockify --web=/usr/share/novnc/ 6080 localhost:5901
