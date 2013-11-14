# .bashrc

# Souce global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Other user specifications
# .bash_profile

# Fix putty ctrl-s
stty ixany
stty ixoff -ixon

export PATH=~/go/bin:~/go-workspace/bin:~/bin:~/Tools:/usr/local/bin:$PATH
export GOPATH=~/go-workspace

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

# Fix "Gtk-WARNING **: cannot open display"
alias git="SSH_ASKPASS='' git"
