alias be='bundle exec'

alias rs='rspec'

alias edit_arb='code ~/projects/a.rb'
alias c_arb='code ~/projects/a.rb'
alias r_arb='ruby ~/projects/a.rb'
alias run_arb='ruby ~/projects/a.rb'

# Rails
alias r4='rails _4.2.8_'
alias r5='rails _5.0.2_'
alias r6='rails _6.1.7.3_'

function r() {
  if [ -n "$USE_DOCKER_FOR_RAILS" ]; then
    docker exec -it $DOCKER_CONTAINER_NAME rails $@
  else
    rails $@
  fi
}

alias rc='r console'
alias routes='r routes'

alias logd='tail -f log/development.log'
alias logt='tail -f log/test.log'

alias mig='r db:migrate'
alias migt='RAILS_ENV=test r db:migrate'

alias rollb_normal='r db:rollback'

alias rollbt='RAILS_ENV=test r db:rollback'

alias seed='r db:seed'

alias rg='r generate'
alias rgc='r generate controller'
alias rgmig='r generate migration'
alias rgmod='r generate model'
alias rgs='r generate scaffold'

# Other

# alias rest='pumactl restart'
