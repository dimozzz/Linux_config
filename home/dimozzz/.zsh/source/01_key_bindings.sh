#!/bin/zsh

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
