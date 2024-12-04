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
projects=(
  demo
  demo-eng
  trg
  kvs
  rolf
)

cd ~/projects
for pr in ${projects[*]}
do
  git clone ssh://git@gitlab.o-din.ru:2222/o-din/$pr.git
  cd $pr
  cp .env.example .env
  cd ..
done

cd ~/projects/gems
for gem in ${gems[*]}
do
  git clone ssh://git@gitlab.o-din.ru:2222/gems/$gem.git
done