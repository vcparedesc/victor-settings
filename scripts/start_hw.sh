end_digit.sh
tmux select-pane -t 0
tmux send-keys Enter
tmux select-pane -t 1
tmux send-keys "roslaunch digit_main main.launch"
tmux send-keys Enter
sleep 15
tmux select-pane -t 2
tmux send-keys "python keyinput.py"
tmux send-keys Enter
