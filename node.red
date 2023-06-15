sudo apt update && sudo apt upgrade -y
# To install Node-RED, you’ll need npm:

sudo apt install npm -y
# This next command installs Node-RED as a global module along with all its dependencies.

sudo npm install -g --unsafe-perm node-red
# When the installation process is completed, you should see a similar message:
# https://i0.wp.com/randomnerdtutorials.com/wp-content/uploads/2020/06/1-DigitalOcean-Installing-Node-RED-NPM.png?w=821&quality=100&strip=all&ssl=1
# Open up a port on your server firewall. Node-RED defaults to using port 1880, so run this next command:

sudo ufw allow 1880
# You can confirm it has succeeded if the end of the command output looks similar to:

node-red start

# Wait a few seconds while everything loads, if you go to your Digital Ocean Droplet IP address followed by the port number 1880:
#  http://YOUR-Digital-Ocean-IP-Address:1880
# For example:
# http://178.62.83.231:1880
#In your console window, press the Ctrl+C key to stop Node-RED.

# Autostart Node-RED on Boot
# To make Node-RED autostart when you boot or restart your Virtual Machine, you need to create a new systemd file for the nodered.service:

To make Node-RED autostart when you boot or restart your Virtual Machine, you need to create a new systemd file for the nodered.service:



