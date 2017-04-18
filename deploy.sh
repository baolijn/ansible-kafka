#! /bin/bash
cmd=$1
ENVIRONMENTS=${ENVIRONMENTS:-dev}

if [[ $cmd = "KAFKA" ]]; then
    if [ $# -eq 1 ]; then
        DEPLOY=kafka
        ansible-playbook -i ansible/environments/${ENVIRONMENTS}/inventory ansible/${DEPLOY}.yml
    else
        echo "please input the KAFKA (deploysys.sh KAFKA)"
    fi
fi

if [[ $cmd == "help" ]]; then
    echo "Aviable subcommands: "
    cat deploy.sh | grep "^if" | grep 'cmd = ' | awk -F'cmd = ' '{print $2}' | awk -F']]' '{print $1}'
fi  
