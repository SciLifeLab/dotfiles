# .bashrc
# kenny.billiau@scilifelab.se

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# aliases
alias ls='ls --color=auto'
alias ll='ls -l'

# HISTORY #
export HISTCONTROL=ignoredups:erasedups  # avoid duplicates..
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append history entries..

# vi vi vi
set -o vi
export EDITOR=vim

