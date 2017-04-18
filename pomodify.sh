#!/usr/bin/env bash

DEFAULT_URI="https://open.spotify.com/user/125937873/playlist/5SgJR30RfzR5hO21TsQhBp"
LOGFILE_PATH="./log_file.txt"
POMO_WORK=25*60
POMO_SH_BREAK=5*60
POMO_LN_BREAK=15*60
N_POMOS=4 
DEFAULT_EDITOR="mvim"

# Setting shuffle on
function shuffleOn() {
	isShuffle=`osascript -e 'tell application "Spotify" to shuffling'`;
	if $isShuffle; 
		then
		echo "shuffle is on";
	else
		osascript -e 'tell application "Spotify" to set shuffling to not shuffling'; 
	fi
}

function countdown() {
	now=$(date +%s)
	end=$((now + $1))
	while (( now < end )); do   
	    printf "%s\r" "$(date -u -j -f %s $((end - now)) +%T)"  
	    sleep 0.25  
	    now=$(date +%s)
	done  
	echo
}

function call_logger() {
	echo -n "* " >> $LOGFILE_PATH;
	date >> $LOGFILE_PATH;
	echo -e "\n" >> $LOGFILE_PATH
	#vim + -c 'startinsert' "$LOGFILE_PATH";
	$DEFAULT_EDITOR "$LOGFILE_PATH"
}

COUNT=0
shuffleOn
while :
do 
	if [ $COUNT -eq 4 ]; then
		osascript -e 'display notification "Time for long break, cya in 15!" with title "Long Break"'
		./spotify pause
		call_logger
		countdown $POMO_LN_BREAK
		COUNT=0
	else 
		#Start Work
		osascript -e 'display notification "Get to work..." with title "Work Time"'
		./spotify play uri $DEFAULT_URI;
		countdown $POMO_WORK;

		#Start Break
		osascript -e 'display notification "Time for short break, cya in 5!" with title "Short Break"'
		./spotify pause
		call_logger
		countdown $POMO_SH_BREAK
		((COUNT++));
	fi
done
