# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update!='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Syntax-highlighted cat (requires python-pygments)
alias dog="pygmentize -g"

# Display a notification with a given message
alias growl="terminal-notifier -message"
# Useful for notifying when a long script finishes
alias yell="terminal-notifier -title WOOOO -message OOOO!!!"

alias cl="clear"
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'

alias reload!='. ~/.zshrc'
alias vi="vim"
alias v="vim"
