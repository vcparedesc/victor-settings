source end_digit.sh
tmux select-pane -t 4
tmux send-keys "roslaunch digit_main main.launch"
tmux send-keys Enter
sleep 1
tmux select-pane -t 1
tmux send-keys "./ar-control lowlevelapi_example.toml"
tmux send-keys Enter
tmux select-pane -t 2
tmux send-keys "python nn_node_fullbody.py"
tmux send-keys Enter
tmux select-pane -t 3
tmux send-keys  "python keyinput.py" 
tmux send-keys Enter


