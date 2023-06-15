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

# To make Node-RED autostart when you boot or restart your Virtual Machine, you need to create a new systemd file for the nodered.service:
sudo nano /etc/systemd/system/nodered.service
# Then, add the following (if you’re using root, you can leave the file as it is – otherwise comment the root and configure the non-root user option):

/*
[Unit]
Description=Node-RED
After=syslog.target network.target

[Service]
ExecStart=/usr/local/bin/node-red --max-old-space-size=128 -v
Restart=on-failure
KillSignal=SIGINT

# log output to syslog as 'node-red'
SyslogIdentifier=node-red
StandardOutput=syslog

#non root user sudo acces like create user_name= kakdwip the user_name replace with kakdwip
# non-root user to run as
WorkingDirectory=/home/user_name/
User=user_name
Group=user_name

# if using a root user
#WorkingDirectory=/root/
#User=root
#Group=root

[Install]
WantedBy=multi-user.target
*/
-----------------------------------------------------------------------------------------------------------
# To enable the Node-RED service and run this file on boot, enter the command:

sudo systemctl enable nodered.service
# Restart your Virtual Machine to test if Node-RED is automatically starting on boot:

sudo reboot
# Wait approximately 2 to 3 minutes for your server to fully restart, when you open your server IP address Node-RED software should load automatically:

#http://YOUR-Digital-Ocean-IP-Address:1880

# Securing Node-RED Software with Username and Password
# Install node-red-admin package to make it available globally:

npm install -g --unsafe-perm node-red-admin
# Run the next command to create a password hash:
node-red-admin hash-pw
# You will be prompted for a password. Type your desired password, press Enter key, and a hash will be printed on screen.

#Copy the hash string to your clipboard and open the Node-RED settings file. In my case the hash is:$2b$08$bQvFgdNi6as2.JwtDENbP.w/JROldMUhY9o9hXExyjQzw1iFRvC9liF
# Open the settings.js file:
sudo nano ~/.node-red/settings.js
# Scroll down and uncomment the adminAuth block (by removing the “// ” in front of each line). Change username to whatever you like, and paste the previously generated hash into the password field.

# Make sure you uncomment and replace the password field with the hash exactly as illustrated above, failing to do it will make it impossible to login and you’ll have to repeat this process.

# Exit the file and save it (Ctr+X, Y, Enter key). Restart your server to ensure that all changes take effect:

sudo reboot
# Now, when you access your Node-RED software you’ll be prompted to enter the username (default is admin) and the password defined earlier.













