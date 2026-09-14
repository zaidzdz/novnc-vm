sudo apt update
sudo apt install -y dillo xfce4 tigervnc-standalone-server novnc python3-websockify python3-numpy
echo "xfce4-session" > ~/.xsession
sudo ufw allow 6080/tcp
sudo ufw reload
