
# alias


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -la --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi



if which tmux > /dev/null; then
	if [[ -z "$TMUX" ]]; then
		count=$(tmux list-session 2> /dev/null | wc -l)
		if tmux has-session 2> /dev/null ; then
			echo "Choose one of the tmux sessions below"
			tmux list-session
			echo "c: Create new tmux session"
			echo "n: Without tmux"
			echo -n "(default=c): "
	        	read choose
	        	case "$choose" in
				"c")
				exec tmux new-session ;;
					"n")
					;;
					"")
				exec tmux new-session ;;
					*)
				exec tmux attach-session -t "$choose" ;;
				esac
			else
				echo "c: Create new tmux session"
				echo "n: Without tmux"
				echo -n "(default=c): "
				read choose
			case "$choose" in
					"n" )
					;;
					* )
				exec tmux new-session ;;
			esac
		fi
	fi
fi



## history
HISTCONTROL=ignoreboth

# # append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# tools
eval "$(starship init zsh)"
tmux source ~/.tmux.conf
