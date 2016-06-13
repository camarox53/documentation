### This documentation will cover how to kickstart a machine 

###### PXE boot the machine from the boot menu 

###### When the PXE boot begins it will leave you at a prompt that says "boot: "

###### Type "menu" at this prompt and it will open up with a  list of OSs that you can choose from

###### Find the OS you wish to boot from but DO NOT HIT ENTER YET

###### Instead of hitting enter, press the TAB key

###### This will open up a window with a black screen and some text, navigate to the bottom of the text and enter the following (or the web location for your kickstart fle) at the end of the kernel line:

	ks=http://LOCATIONOFYOURKICKSTARTFILEONTHEWEB.cfg

###### Then go ahead and boot the machine

###### Once the machine finishes the install and reboots you should be presented with a login prompt
