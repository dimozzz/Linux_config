#!/bin/zsh

HISTFILE=~/.zsh/temp/histfile
HISTSIZE=1000
SAVEHIST=1000


export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}'):$(print '%{\e[0;34m%}%~%{\e[0m%}')$ "
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"
