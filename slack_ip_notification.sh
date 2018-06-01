#!/bin/bash
currentIp=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

previous=$(cat /home/joe/IdeaProjects/bash/previousAddress.txt)

msg="{\"text\": \"$currentIp\"}"

if [ "$currentIp" != "$previous" 	]; then
     curl -s -d "payload=$msg" "https://hooks.slack.com/services/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"
     echo  $'\n'"New IP: $currentIp"
else 
    echo "No IP change."
fi
ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/' >previousAddress.txt

