#!bin/bash

# case $var in 
#    opt)1 commmands1 ;;
#    opt)2 commmands2 ;;
# esac

ACTION=$1

case $ACTION in
    start)
        echo "XYZ Service is Starting"  
       ;;
    stop)
        echo "XYZ Service is Stopping"
        ;;
    restart)
        echo "XYZ service is restarting"
        ;;        

esac

#hello