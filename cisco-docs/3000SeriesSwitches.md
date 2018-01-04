## Look at the configuration of a switch port

#####Elevate your privileges 
  `$ enable`

#####Move to configuration mode
  `$ configure terminal`
  
#####Change to the interface of the port you want to edit
  `$ interface GigabitEthernet0/9`
  
#####Look at the configuration of the port
  `$ show interface Gi0/9 switchport`
  
#####Leave the switch
  `$ exit`

##Set a switch port into trunking mode

#####Elevate your privileges
  ` $ enable`
  
#####Move to configuration mode
  ` $ configure terminal`
  
#####Change to the interface of the port you want to edit
  ` $ interface GigabitEthernet0/9`
  
#####Change the switch port mode to trunk
` $ switchport mode trunk`

#####Leave config mode
  ` $ exit`
  
#####Verify your changes are correct
  ` $ show interface Gi0/9 switchport`
  
#####Make configuration permanent
  ` $ copy running-config startup-config`
  
#####Leave the switch
  ` $ exit`

##Set the native vlan on a switch port

#####Elevate your privileges
  ` $ enable`
  
#####Move to configuration mode
  ` $ configure terminal`
  
#####Change to the interface of the port you want to edit
  ` $ interface GigabitEthernet0/9`
#####  Change the switchport to trunk mode
  ` $ switchport mode trunk`
#####  Set your native vlan
  ` $ switchport trunk native vlan 183`
#####  Leave config mode
  ` $ exit`
#####  Verify your changes are correct
  ` $ show interface Gi0/9 switchport`
#####  Make configuration permanent
  ` $ copy running-config startup-config`
#####  Leave the switch
  ` $ Exit`

##Set the allowed vlan range for a switch port

#####Elevate your privileges
        $ enable
        
#####Move to configuration mode
        $ configure terminal
        
#####Change to the interface of the port you want to edit
        $ interface GigabitEthernet0/9
        
#####Change the switchport to trunk mode
        $ switchport mode trunk
        
#####[Optional] - Set native vlan
        $ switchport trunk native vlan 183
        
######Without this, all untagged traffic will be dropped by the switch

#####Allow all the vlan ranges that you will need
        $ switchport trunk allowed vlan 180-185
        
#####Leave config mode
        $ exit
        
#####Verify your changes are correct
        $ show interface Gi0/9 switchport
        
#####Make configurations permanent
        $ copy running-config startup-config
        
####  Leave the switch
        $ exit
