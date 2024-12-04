pg_container_id() {
 ssh $1 'docker ps --format="{{.ID}} {{.Names}}" | grep _postgres | cut -c-12'
}
dump_db() {
 ssh $1 "docker exec -i $(pg_container_id $1) pg_dump -U app app"
}
apply_db() {
 psql -h localhost -d $1 -U odin < ~/projects/$1.sql
}
dump_and_apply_db() {
 dump_db $1 | psql -h localhost -d $1 -U odin
}
alias ddb='dump_db'
alias ddb!='dump_and_apply_db'
alias udb='apply_db'

gems=(
  o-din
  o-din-maintenance
  o-din-audit
  o-din-director
  o-din-ku
  o-din-parking
  o-din-pm
  o-din-ppr
  o-din-rounds
  o-din-stock
  o-din-turnover
  o-din-lk
  o-din-report
)
update_gems() {
  cwd=$(pwd)
  for gem in ${gems[*]}
  do
    cd ~/projects/gems/$gem
    git stash
    git checkout master
    git pull --rebase
    echo -e "\033[32m [*] updating $gem ...\033[0m"
  done
  cd $cwd
}

config_gems() {
  for gem in ${gems[*]}
  do
    bundle config local.$gem ~/projects/gems/$gem
  done
}