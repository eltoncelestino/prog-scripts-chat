#!/bin/bash

tmux kill-session
echo "Bem-vindo!"
read -p "Digite seu nome:" client
read -p "Digite o IP do Servidor:" ip

SESSION=${SESSION:='Grupo3'}

tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Chat'
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "./user_tela.sh $client $ip" C-m
tmux send-keys "clear" C-m
tmux select-pane -t 1
tmux send-keys "./user_msg.sh $client $ip" C-m

tmux attach-session -t $SESSION

