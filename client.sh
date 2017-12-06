#!/bin/bash

rm -rf conversas.txt chatzao.txt primeirao.txt
read -p "Usuario: " u

#echo > arquivo.txt
#tela=$(dialog --stdout --title "Chat" --editbox "arquivo.txt" 0 0)
#echo "$tela" > arquivo.txt

hose localhost 8801 --netslave > primeirao.txt
clear
while true
do
	hose localhost 8801 --netslave > chatzao.txt
	diff -i chatzao.txt primeirao.txt | grep \< | cut -d'<' -f 2 | sed "s/^ $u/Você/" >> conversas.txt
	tput cup 2 0
	cat conversas.txt
	cat chatzao.txt > arquivo.txt
	tput cup 35 0
	echo "--------------------------------------------------------------------------------------------"
	echo ""
	echo -e "Mensagem: \c"
	read m
	clear
	if [ ! -z "$m" ]; then
		hose localhost 8800 --out sh -c "echo $u: $m"
	fi
done

