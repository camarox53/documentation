## Systemd tool guide 

### Systemctl
##### Check the status of a service 
`systemctl status <service_name>`

##### Check to see if a service is enabled
`systemctl is-enabled <service_name>`

##### Reload the systemd configuration
`systemctl daemon-reload`
Used to reload all of the systemd config

##### Start a service 
`systemctl start <service_name>`

##### Stop a service 
`systemctl stop <service_name>`

##### Enable a service 
`systemctl enable <service_name>`

##### Disable a service 
`systemctl disable <service_name>`

##### Restart a service 
`systemctl restart <service_name>`

##### Reload a service 
`systemctl reload <service_name>`
Used to reload configuration files for the service 

##### List running services
`systemctl`

##### See how long it takes services to boot up 
`systemd-analyze blame`

######Need a cool looking graph?:
`systemd-analyze plot > graph1.svg`

##### List all failed units
`systemctl --failed`

##### Manage a remote host with systemd
`systemctl -H root@remotehost status httpd.service`


## Changing the default boot target 
##### Show to current run level
`systemctl get-default`

##### full system no graphics 
`systemctl set-default multi-user.target`

##### full graphics
`systemctl set-default graphical.target`

##### To change the target within the current session
`systemctl isolate multi-user.target`

## journalctl
##### Show the logs for a service
`journalctl -u <service_name>`

##### Follow the log files 
`journalctl -f` 

##### Check the logs for a specific PID
`journalctl _PID=16388`

##### Show the logs from the current boot 
`journalctl -b`

##### Show the logs from the previous boot
`journalctl -b -1`

######	Boot before the last one:
`journalctl -b -2`


## Tips and Tricks
###### Background Info:
Things in /etc/systemd/system override those in /lib/systemd/system
/etc/systemd/system = for sysadmins
/lib/systemd/system = for distros

##### Stop a service from ever starting 
`systemctl mask <service_name>`


