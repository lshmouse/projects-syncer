#!/bin/bash

usage() {
  echo "Usage: bash $0 config-file"
}

init_project() {
  git clone $local_repo $project_home
}

DATA_DIR=${SYNCER_DATA_DIR:-".projects"}

sync() {
  cd $project_home
  git checkout .
  git clean -df

  git checkout $default_branch
  git remote set-url origin $remote_repo
  git pull
  for branch in ${branches[@]};
  do
    git checkout -b $branch origin/$branch
  done

  git checkout $default_branch
  git remote set-url origin $local_repo
  git push --all
  git push --tags
  for branch in ${branches[@]};
  do
    git branch -D $branch
  done
  git fetch -p
  echo "sync $project success!"
}

if [ $# != 1 ]; then
  usage
  exit
fi

config=$1
. $config
project_home=$DATA_DIR/$project
if [ ! -d $project_home ]; then
  init_project
fi
sync
