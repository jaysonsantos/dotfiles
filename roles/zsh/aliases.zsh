# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Syntax-highlighted cat (requires python-pygments)
alias dog="pygmentize -g"

alias cl="clear"
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'
alias dil='doitlive'
alias dilp='doitlive play'

alias reload!='. ~/.zshrc'
alias vi="vim"
alias v="vim"

alias ef='hello work'
alias h='hello home'
alias elb-headers="echo 'type timestamp elb client target request_processing_time target_processing_time response_processing_time elb_status_code target_status_code received_bytes sent_bytes request user_agent ssl_cipher ssl_protocol target_group_arn trace_id domain_name chosen_cert_arn matched_rule_priority request_creation_time actions_executed filler?'"
alias encode-json-string="python3 -c 'import json, sys; print(json.dumps(sys.argv[1]))'"
