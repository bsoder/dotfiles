# -----------------------------------------------------------
# bash_profile
# 
# config for login shell on linux and all shells on mac osx
# -----------------------------------------------------------

# Source bashrc file
if [ -f ~/.bashrc ]; then 
    source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
