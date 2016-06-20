## Create and start a second copy of ssh 

#### Create a copy of the sshd_config
`cp /etc/ssh/sshd_config /etc/ssh/sshd-second_config`

#### Edit the file and change the port and PID to something of your choice
`vim /etc/ssh/sshd-second_config`

#### Create a copy of the systemd unit file
`cp /usr/lib/systemd/system/sshd.service /etc/systemd/system/sshd-second.service`

#### Modify your new unit file to include your new ssh config
`ExecStart=/usr/sbin/sshd -D -f /etc/ssh/sshd-second_config $OPTIONS`

##### Using se linux?  
`semanage port -a -t ssh_port_t -p tcp <port_Number>`

#### Enable sshd-second.service to start on boot
`systemctl enable sshd-second.service `

#### Start the service 
`systemctl start sshd-second.service `

#### Test the service 
`ssh -p <port_number> user@host`


