# Lines configured by zsh-newuser-install
HISTFILE=~/.bash_history
HISTSIZE=1000000
SAVEHIST=100000
setopt appendhistory notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/billiau/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# custom
autoload -U promptinit
promptinit
prompt walters 
prompt pws

# add reverse history search to the VI keybindings
bindkey "^R" history-incremental-search-backward

# default editor
export EDITOR=vim

# some aliasses
alias ls="ls --color"
alias ll="ls -l"
