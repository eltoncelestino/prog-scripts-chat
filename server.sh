#!/bin/bash
if [ -f msgrecebidas.txt ];then
	rm -rf msgrecebidas.txt
fi

faucet 8800 --in sh -c "cat >> msgrecebidas.txt; faucet 8801 --out cat msgrecebidas.txt;" &> /dev/null


