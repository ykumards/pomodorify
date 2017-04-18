#!/usr/bin/env bash

DEFAULT_URI="https://open.spotify.com/user/125937873/playlist/5SgJR30RfzR5hO21TsQhBp"
LOGFILE_PATH="/Users/yogesh/Desktop/pomo_logger.txt"
POMO_WORK=25*60
POMO_SH_BREAK=5*60
POMO_LN_BREAK=15*60
N_POMOS=0 
DEFAULT_EDITOR="sublime"

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

# ./spotify play uri $DEFAULT_URI;
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

countdown 3
call_logger
countdown 5
