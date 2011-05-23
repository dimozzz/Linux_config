
case $TERM in
  # for (/dev/tty*)
 linux|screen|screen.linux)
	bindkey "^[[2~" yank
	bindkey "^[[3~" delete-char
	bindkey "^[[A"  up-line-or-history
 	bindkey "^[[B"  down-line-or-history
 	bindkey "^[[1~" beginning-of-line
 	bindkey "^[[4~" end-of-line
 	bindkey "^[e"   expand-cmd-path 		# C-e for expanding path of typed command
 	bindkey "^[[5~" up-line-or-search   	# up arrow for back-history-search
 	bindkey "^[[6~" down-line-or-search 	# down arrow for fwd-history-search
 	bindkey " "  	magic-space           	# do history expansion on space
 ;;

 # for X-terminals
 *xterm*|rxvt*|*terminal*|(dt|k|E)term)
 	bindkey "^[[2~" yank
 	bindkey "^[[3~" delete-char
 	bindkey "^[[A"  up-line-or-history
 	bindkey "^[[B"  down-line-or-history
 	bindkey "^[[H"  beginning-of-line 		# Home
 	bindkey "^[[F"  end-of-line 			# End
	bindkey "^[OH"  beginning-of-line 		# Home
 	bindkey "^[OF"  end-of-line 			# End
 	bindkey "^[[7~"  beginning-of-line 		# Home
 	bindkey "^[[8~"  end-of-line 			# End
 	bindkey "^E"    expand-cmd-path      
 	bindkey "^[[5~" up-line-or-search  
 	bindkey "^[[6~" down-line-or-search 
 	bindkey " "  	 magic-space            # do history expansion on space
 ;;
esac


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
#bindkey -e
# End of lines configured by zsh-newuser-install

setopt  APPEND_HISTORY
setopt  HIST_IGNORE_ALL_DUPS
setopt  HIST_IGNORE_SPACE
setopt  HIST_REDUCE_BLANKS

export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}'):$(print '%{\e[0;34m%}%~%{\e[0m%}')$ "
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

alias ls='ls --color=auto -GF'
alias ps='ps -e'
alias pause='mpc pause'
alias play='mpc play'
alias next='mpc next'
alias prev='mpc prev'
alias clear='mpc clear'
alias add='~/.myScripts/mpcAdd.sh title artist'
alias addall='~/.myScripts/mpcAdd.sh album artist'
alias addart='~/.myScripts/mpcAdd.sh artist album'
alias list='mpc playlist'
alias cmplayer='~/.myScripts/cmplayer.sh'
alias cuesplit='~/.myScripts/cuesplit.sh'
alias m4atomp3='~/.myScripts/m4aToMp3.sh'
alias idea='~/.myScripts/idea.sh'
alias music='cd /home/dimozzz/NTFS/sound'
alias video='cd /home/dimozzz/NTFS/dimon/south\ park/Разное'
alias wine='LANG=ru_RU.UTF-8 wine'
alias converttags='~/.myScripts/convertTags.sh'
alias aspellru='aspell -d ru -c'
alias aspellen='aspell -d en -c'
alias rtorr='sudo /etc/rc.d/rtorrentInit.sh'
alias emc='emacsclient -c'
