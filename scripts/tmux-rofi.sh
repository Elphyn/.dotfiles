
# Get tmux sessions (only names)
sessions=$(tmux ls 2>/dev/null | awk -F: '{print $1}')

# If no sessions exist, exit
[ -z "$sessions" ] && exit 0

# Show rofi menu
chosen=$(echo "$sessions" | rofi -dmenu -p "tmux sessions")

# If user pressed Esc, exit
[ -z "$chosen" ] && exit 0

# Open terminal and attach
alacritty -e tmux attach-session -t "$chosen"
