# On Ubuntu, pyenv is installed on the home folder by default
# On MacOS, brew creates a /usr/local/bin/pyenv file which is not created on Ubuntu
test -f ~/.pyenv/bin/pyenv && export PATH=~/.pyenv/bin:${PATH}
