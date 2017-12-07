#!/bin/bash
rm -rf conversas.txt chatzao.txt primeirao.txt
u=$1
ip=$2
echo $u > usr
clear
hose $ip 8801 --netslave > primeirao.txt 2> /dev/null
while true
do
        hose $ip 8801 --netslave > chatzao.txt 2> /dev/null
#       tput cup 30 0
        diff -i chatzao.txt primeirao.txt | grep \< | cut -d'<' -f 2 | sed "s/^ $u/Você/" >> conversas.txt
        var=$(diff -i chatzao.txt primeirao.txt | grep \< | cut -d'<' -f 2 |head -n1)
        if [ ! -z "$var" ]
        then
                tput cup 2 0
                cat conversas.txt
                cat chatzao.txt > primeirao.txt
        fi
done

