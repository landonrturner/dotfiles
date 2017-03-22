export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LSCOLORS=ExFxBxDxCxegedabagacad

PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

# EXPORTS
export PS1='\[\e[32m\]\w\[\e[91m\]$(__git_ps1) \[\e[93m\]$ \[\e[0m\]'

# ALIASES
alias ll='ls -lrt'
alias la='ls -alrth'
alias tmux_outer="tmux -L outer_tmux_socket"
alias tmux="tmux -L tmux-${RANDOM}"
alias ressh='eval $(ssh-agent); ssh-add'

function run_last_command {
  eval $(history 2 | head -n 1 | awk '{for (i=2; i<=NF; i++) printf $i" "}')
  history -d $(history | tail -n 1 | awk '{ print $1 }')
}
alias dbdo="./bin/rails db:migrate RAILS_ENV=test"

alias redshift='psql -h bt-data-production.cizsr4oqzecy.us-east-1.redshift.amazonaws.com -p 5439 -d warehouse -U lanturner_ro'
