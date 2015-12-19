# -----------------------------------------------------------
# bash_aliases
# 
# set up bash aliases
# -----------------------------------------------------------

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# determine operating system
os=`uname -s`

case "$os" in
    # Mac OS X
    Darwin)
        alias prodpass='lpass login bsoder@gmail.com; lpass show --field="production password" "Active Directory" | pbcopy; echo -e "Y" | lpass logout'
        alias gcc=gcc-5
    ;;
    *) ;;
esac
