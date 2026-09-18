#!/usr/bin/env bash

set -euo pipefail


if ! pgrep -u "$(id -u)" -x chrome >/dev/null; then
	DISPLAY=:1 google-chrome \
		--start-maximized \
		--no-first-run \
		--no-default-browser-check \
		--disable-extensions \
		--disable-sync \
		--disable-translate \
		--disable-background-networking \
		--disable-component-update \
		--disable-default-apps \
		--disable-session-crashed-bubble \
		>/tmp/google-chrome.log 2>&1 &
fi

exec websockify --web=/usr/share/novnc/ 6080 localhost:5901
