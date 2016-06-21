#!/bin/bash
# git pull

update() {
  remotes=`git remote -v`
  if [ ! -z "$remotes" ]; then
    git pull
  fi
}

update

configs=`ls configs`
for config in ${configs[@]}; do
  echo "Reading project config from configs/$config"
  bash sync.sh configs/$config
done
echo "Sync all projects finished!"
