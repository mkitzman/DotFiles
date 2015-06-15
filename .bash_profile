export JAVA_LIBRARY_PATH=/usr/local/lib
export CLIENT_DIR=/Users/kitzman/Sites/menu/repo/
export SITE_DIR=/Users/kitzman/Sites/www/site/dist/
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/kitzman/.docker/machine/machines/dev
export DOCKER_HOST=tcp://192.168.99.100:2376

alias dm=docker-machine
alias ebash="subl ~/.bash_profile"
alias ehosts="subl /etc/hosts"
alias sbash="source ~/.bash_profile"
alias cdns="sudo discoveryutil mdnsflushcache"

alias gos="cd ~/Sites"
alias gosite="cd /Users/kitzman/Sites/www/site/dist/"
alias gocl="cd /Users/kitzman/Sites/menu/repo/"
alias gosh="cd /Users/kitzman/Sites/addthis-shared-dependencies"

alias gw="gulp watch"
alias dmstart="docker-machine start"
alias dmrs="docker-machine start"
alias dmls="docker-machine ls"
alias sstart="atpub site_client"

alias fetchtags="git fetch --tags"
alias remotetags="git ls-remote --tags origin"

#git branch in command prompt
source ~/.git-prompt.sh
PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w\[\e[0m\]\$(__git_ps1)\[\e[1;34m\] \$\[\e[0m\] "

#Get current branch
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

#Show Files changed vs master
function b2m() {
    local branchName=$(parse_git_branch)
    eval git diff --name-status master..$branchName
}

#Compare branch file to master
function f2m() {
    eval "git diff master -- $1"
}

#dashboard tests, ex: gtest SubscriptionStoreSpec.js
function gtest() {
    eval "gulp test --spec $1"
}