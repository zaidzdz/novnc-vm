sudo apt update
sudo apt install -y openbox tigervnc-standalone-server novnc python3-websockify python3-numpy wget gnupg ufw

wget -qO- https://dl.google.com/linux/linux_signing_key.pub \
	| gpg --dearmor \
	| sudo tee /usr/share/keyrings/google-chrome.gpg >/dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
	| sudo tee /etc/apt/sources.list.d/google-chrome.list >/dev/null
sudo apt update
sudo apt install -y google-chrome-stable
sudo ln -sfn vnc.html /usr/share/novnc/index.html

cat > ~/.xsession <<'EOF'
#!/bin/sh

openbox-session &
exec google-chrome \
	--start-maximized \
	--no-first-run \
	--no-default-browser-check \
	--disable-extensions \
	--disable-sync \
	--disable-translate \
	--disable-background-networking \
	--disable-component-update \
	--disable-default-apps \
	--disable-session-crashed-bubble
EOF
chmod +x ~/.xsession
sudo ufw allow 6080/tcp
sudo ufw reload
