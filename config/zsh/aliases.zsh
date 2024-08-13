# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFha'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lsr='ls -lARFh' #Recursive list of files and directories
alias lsn='ls -1'     #A column contains name of files and directories

alias grep='grep --color'

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"

(( $+commands[fd] )) || alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias m

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Docker
alias d=docker
alias dp="docker ps"
alias docker-nuke="~/bin/docker-nuke"

# Instabee
alias f=fintech

# Kubernetes
alias k=kubectl
alias kn="kubectl -n"
alias kni="kubectl -n invoicing"
alias knc="kubectl -n contracts"
alias knf="kubectl -n fortnox"
alias kcx=kubectx

# Git
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit --verbose --amend'
compdef _git gc!=git-commit
alias gcb='git checkout -b'
compdef _git gcb=git-checkout
alias gcmsg='git commit -m'

# Random
alias y=yazi
