# .bashrc
# Mario Giovacchini (mario@scilifelab.se)

# Modules, activate the module command
case "$0" in
          -sh|sh|*/sh)	modules_shell=sh ;;
       -ksh|ksh|*/ksh)	modules_shell=ksh ;;
       -zsh|zsh|*/zsh)	modules_shell=zsh ;;
    -bash|bash|*/bash)	modules_shell=bash ;;
esac
module() { eval `/usr/local/Modules/$MODULE_VERSION/bin/modulecmd $modules_shell $*`; }

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


########
# USER #
########
# REGION SETTINGS
export LC_CTYPE=en_US.UTF-8

# ALIASES
alias ..='cd ..'
alias vir='vim -R'
alias glist='git branch -a'
alias gitlist=glist
alias ls='ls -F --group-directories-first --color'
alias miloub='ssh milou-b'

# PROMPT
# Clone git-aware-prompt under $HOME/.bash from https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \[$txtylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/anaconda/bin:$PATH

# PYTHONPATH
export PYTHONPATH=$HOME/anaconda/lib/python2.7:$HOME/lib/python2.7:$PYTHONPATH

# MODULEPATH
export MODULEPATH=~/opt/bioinf-tools-local:$MODULEPATH

#BLAST database on UPPMAX
export BLASTDB=/sw/data/uppnex/blast_databases

# LOCAL LIBRARY / INCLUDE
# Making this a function because it seems to mess with the tcl module paths
# Can instead do a static compile with compiler flags -- neither seems great to me
# e.g. ./configure --prefix=$HOME CFLAGS="-I/home/mario/anaconda/include" LDFLAGS="-L/home/mario/anaconda/lib"
# There must be a better way to do this
function export_ld () {
    export LD_LIBRARY_PATH=$HOME/lib:$HOME/anaconda/lib:$LD_LIBRARY_PATH
}


##################
# BASH FUNCTIONS #
##################

# kludgy argument handling here - fix to shift args off command line
# now have to use quotes like:
#       repeat "jobinfo -u mario" 10
repeat() {
    if [ -z "$1" ]
    then
        echo "Needs parameter function"
        return 1
    else
        echo "command is '$1'"
        command=$1
    fi
    if [ -z "$2" ]
    then
        echo "interval set to 10 s (default)"
        interval=10
    else
        echo "interval set to $2 s"
        interval=$2
    fi
    while [ 1 ]
    do
        echo
        #date
        eval $command
        sleep $interval
    done
    return 0
}

# Poll SLURM jobs
poll_jobs() {
    repeat 'echo; jobinfo -u mario | grep -v -E "Nodes|jobs|that" | sed "/^$/d"'
}



##
##  Unused options
##

# Show bash keybindings 
#bind -p

# Change from emacs-like (ctrl-a, ctrl-e, ctrl-w) to vi-like bash commands
#set editing mode vi

# Don't want to type ssh keyfile password every time
#eval "$(ssh-agent -s)" 2>&1 > /dev/null
#ssh-add

# startup virtualenv-burrito
#if [ -f $HOME/.venvburrito/startup.sh ]; then
#    . $HOME/.venvburrito/startup.sh
#fi




