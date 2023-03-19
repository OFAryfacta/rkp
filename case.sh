#!bin/bash

# case $var in 
#    opt)1 commmands1 ;;
#    opt)2 commmands2 ;;
# esac

ACTION=$1

case $ACTION in
    start)
        echo "XYZ Service is Starting"  
        exit 0
       ;;
    stop)
        echo "XYZ Service is Stopping"
        exit 0
        ;;
    restart)
        echo "XYZ service is restarting"
        exit 0
        ;;
    *)
    echo "not a valid option"
    exit 1                 
esac

#hello