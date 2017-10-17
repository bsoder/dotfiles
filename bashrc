# -----------------------------------------------------------
# bashrc
# 
# config for non-login shell, except mac os x
# sourced from bash_profile
# -----------------------------------------------------------

# determine operating system
os=`uname -s`

# set bash_completion through homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then 
    . $(brew --prefix)/etc/bash_completion
fi

# operating system specific settings
case "$os" in
    Darwin)
        #colorflag="-G"
        colorflag="--color" # using gnu coreutils through homebrew
        PATHPOSTPEND=""
        ;;
    Linux)
        colorflag="--color"
        PATHPOSTPEND=""
        ;;
    *)
        colorflag=""
esac

# -----------------------------------------------------------
# set up PATH
# -----------------------------------------------------------

# backup old PATH
OLDPATH=$PATH

# set PATH so it includes user's private bin if it exists
if [ -d ${HOME}/bin ] ; then
    PATH="${HOME}/bin:${PATH}"
fi

# set PATH so it includes /usr/local/bin if it exists
if [ -d /usr/local/bin ] ; then
    PATH="/usr/local/bin:${PATH}"
fi

# set PATH so it includes /usr/local/sbin if it exists
if [ -d /usr/local/bin ] ; then
    PATH="/usr/local/sbin:${PATH}"
fi

# set PATH so it includes /usr/local/opt/gnu-which/libexec/gnubin if it exists
if [ -d /usr/local/opt/gnu-which/libexec/gnubin ] ; then
    PATH="/usr/local/opt/gnu-which/libexec/gnubin:${PATH}"
fi

# set PATH so it includes /usr/local/opt/gnu-tar/libexec/gnubin if it exists
if [ -d /usr/local/opt/gnu-tar/libexec/gnubin ] ; then
    PATH="/usr/local/opt/gnu-tar/libexec/gnubin:${PATH}"
fi

# set PATH so it includes /usr/local/opt/coreutils/libexec/gnubin if it exists
if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
fi

# add various bins to PATH
PATH=$PATH:/usr/sbin:/sbin

# android development
PATH=$PATH:/Users/bsoder/dev/android-sdk-macosx/tools:/Users/bsoder/dev/android-sdk-macosx/platform-tools

# add manpath for various utils
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/share/man:/usr/share/man:/usr/local/share/man"

# build new path and remove duplicates
NEWPATH=""
quoteold=(`echo $PATH:$OLDPATH:$PATHPOSTPEND | sed -e 's/ /%%/g' -e 's/:/ /g'`)
for i in ${quoteold[@]} ; do
  if [ -z "$NEWPATH" ]
  then
    NEWPATH="$i"
  else
    if { echo ":$NEWPATH:" | sed -e 's/ /%%/g' | grep -c ":$i:" > /dev/null; } 
  then
    echo foo > /dev/null
  else
    NEWPATH=${NEWPATH}:"$i"
  fi
fi
done
export PATH=$NEWPATH

# -----------------------------------------------------------
# additional configurations
# -----------------------------------------------------------

# various exports
export EDITOR=vim
export HOMEBREW_GITHUB_API_TOKEN=$HOMEBREW_TOKEN

# set up ls per operating system
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ow=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# aliases
source ~/.bash_aliases

# configure history
HISTCONTROL=ignoredups                            # ignore the line if it matches previous line
HISTFILESIZE=20000                                # size of the history file
HISTSIZE=1000                                     # size of the run-time history list
HISTIGNORE=ls:ll:la:l:cd:pwd:exit:mc:su:df:clear  # do not put these in history file
HISTFILE=~/.bash_history-`hostname`               # track history by host
export HISTCONTROL HISTFILESIZE HISTSIZE HISTIGNORE HISTFILE

# color man pages:
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# start tmux on shell startup
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
