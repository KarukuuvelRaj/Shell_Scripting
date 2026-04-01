#!/usr/bin/env bash
SERVICE=$1

servicemonitor(){
        local service=$1
        if sudo systemctl is-active --quiet $service
        then
                echo "$service is healthy and running"
        else
                sudo systemctl restart $service
                sleep 5
                if sudo systemctl is-active --quiet $service
                then
                        echo "$service is restarted successfully"
                else
                        echo "Manual intervention is needed"
                fi
        fi
}
echo "Monitoring the $SERVICE"
echo "----------------------------------------------"
servicemonitor $SERVICE
