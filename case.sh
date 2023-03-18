#!bin/bash

# case $var in 
#    opt)1 commmands1 ;;
#    opt)2 commmands2 ;;
# esac


case $ACTION in
    strart)
        echo "XYZ Service is Starting"  
       ;;
    stop)
        echo "XYZ Service is Stopping"
        ;;
    restart)
        echo "XYZ service is restarting"
        ;;        

esac