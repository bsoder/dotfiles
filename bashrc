if [ -f $(brew --prefix)/etc/bash_completion ]; then . $(brew --prefix)/etc/bash_completion; fi
export HOMEBREW_GITHUB_API_TOKEN="0e5fa0c0a846cd7ad076b16d240822eeb3efc398"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/share/man:/usr/share/man:/usr/local/share/man"
alias ls='ls --color'
alias prodpass='lpass login bsoder@gmail.com; lpass show --field="production password" "Active Directory" | pbcopy; echo -e "Y" | lpass logout'
alias gcc=gcc-5
