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
alias cdns="sudo killall -HUP mDNSResponder;say flushed"

alias gos="cd ~/Sites"
alias gosite="cd /Users/kitzman/Sites/www/site/dist/"
alias gocl="cd /Users/kitzman/Sites/menu/repo/"
alias gosh="cd /Users/kitzman/Sites/addthis-shared-dependencies"
alias gofit="cd /Users/kitzman/Sites/fitthisse"

alias gw="gulp watch"
alias dmstart="docker-machine start"
alias dmrs="docker-machine start"
alias dmls="docker-machine ls"
alias sstart="atpub site_client"
alias fitstart="cd /Users/kitzman/Sites/fitthisse && mvn -Pfitnesse test"

alias fetchtags="git fetch --tags"
alias remotetags="git ls-remote --tags origin"
alias gb="git branch"
alias gs="git status"
alias gp="git pull"
alias gmm="git merge origin master"

function gcb {
    eval "git checkout $1"
}

function gd {
    eval "git diff $1"
}

function ga {
    eval "git add $1"
}

#git branch in command prompt
source ~/.git-prompt.sh
PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w\[\e[0m\]\$(__git_ps1)\[\e[1;34m\] \$\[\e[0m\] "

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

function mack() {
    eval "ack '$1' --ignore-file=is:bundle.js --ignore-file=is:9.9.js --ignore-file=is:8.8.js"
}

# nvm
[ -s "/Users/kitzman/.nvm/nvm.sh" ] && . "/Users/kitzman/.nvm/nvm.sh"
set PATH $PATH:/Users/kitzman/.nvm/bin/
nvm use default
