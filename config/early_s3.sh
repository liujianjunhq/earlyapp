#!/bin/bash

case $1 in
    pre)  
	/usr/bin/echo 2 > /usr/share/earlyapp/resume_sync
	while [ `/usr/bin/cat /usr/share/earlyapp/resume_sync` != "0" ]; do /usr/bin/echo wait; done 
	;;
    post)
	/usr/bin/echo 1 > /usr/share/earlyapp/resume_sync
	;;
esac
