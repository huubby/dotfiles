# .bashrc

# Souce global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Other user specifications
# .bash_profile

# Get aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=~/bin:~/Tools:/usr/local/bin:$PATH

# Terminal color
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
export TERM=xterm-256color

# set LANG to C, treat all ASCII as themselves and non-ASCII as literals
export LANG=C

# SVN 
source ~/.svn.bashrc

# Aliases
alias ll='ls -l'
