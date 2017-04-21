export BASH_CONF="bash_profile"
source ~/.git-completion.bash

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias vm-mount-banking="sshfs -o allow_other,defer_permissions root@devtest:/opt/figo/banking ~/figo/banking -ovolname=figoBanking"
alias ll='ls -lah'