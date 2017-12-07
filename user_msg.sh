#!/bin/bash

ip=$1
u=$(cat usr)
clear
while true
do
        tput cup 35 0
        echo "--------------------------------------------------------------------------------------------"
        echo ""
        echo -e "Mensagem: \c"
        read m
        clear
        if [ ! -z "$m" ]; then

                if [ "$m" == "exit" ]
                then
                        hose $ip 8800 --out sh -c "echo O usuario $u saiu do chat." 2> /dev/null
                        tmux kill-session
                        exit 0
                else
                        hose $ip 8800 --out sh -c "echo $u: $m" 2> /dev/null
                fi
        fi
done
