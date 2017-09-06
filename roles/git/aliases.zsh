alias g="git"
alias gf="git flow"

# Override prezto
alias gs="git status"
alias gl="git pull"

# Some shortcuts I used with Oh My Zsh
alias gaa='git add --all'
alias gcd='git checkout develop'
alias gci='git-checkout-issue'
alias gcm='git checkout master'
alias gdd='git diff develop'
alias gdm='git diff master'
alias gld='git log ...develop'
alias glm='git log ...master'
alias gst="git status"
alias gsta='git add -A; git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gwip='git add -A; git ls-files --deleted -z | xargs git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
