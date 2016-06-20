#! /bin/bash

##Create a second ssh instance##

# Create a new ssh config file
cp /etc/ssh/sshd_config /etc/ssh/sshd-second_config

# Replace port number
sed -i 's/#Port 22/Port 65300/g' /etc/ssh/sshd-second_config

# Replace the Pid file
sed -i 's/#PidFile \/var\/run\/sshd.pid/PidFile \/var\/run\/sshd-second.pid/g' /etc/ssh/sshd-second_config

# Create the new service file
echo "[Unit]" > /etc/systemd/system/sshd-second.service
echo "Description=OpenSSH server second daemon" >> /etc/systemd/system/sshd-second.service
echo "After=network.target sshd-keygen.service" >> /etc/systemd/system/sshd-second.service
echo " " >> /etc/systemd/system/sshd-second.service
echo "[Service]" >> /etc/systemd/system/sshd-second.service
echo "EnvironmentFile=/etc/sysconfig/sshd" >> /etc/systemd/system/sshd-second.service
echo 'ExecStart=/usr/sbin/sshd -D -f /etc/ssh/sshd-second_config $OPTIONS' >> /etc/systemd/system/sshd-second.service
echo 'ExecReload=/bin/kill -HUP $MAINPID' >> /etc/systemd/system/sshd-second.service
echo "KillMode=process" >> /etc/systemd/system/sshd-second.service
echo "Restart=on-failure" >> /etc/systemd/system/sshd-second.service
echo "RestartSec=42s" >> /etc/systemd/system/sshd-second.service
echo " " >> /etc/systemd/system/sshd-second.service
echo "[Install]" >> /etc/systemd/system/sshd-second.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/sshd-second.service

# Deal with selinux 
semanage port -a -t ssh_port_t -p tcp 65300

# Reload the systemctl daemon
systemctl daemon-reload

# Reload the service
systemctl reload sshd-second.service

# Start the service 
systemctl start sshd-second.service

echo "Done"
