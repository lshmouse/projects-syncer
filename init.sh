#!/bin/bash

usage() {
  echo "Usage: bash $0 config-file"
}

DATA_DIR=${SYNCER_DATA_DIR:-".projects"}

if [ $# != 1 ]; then
  usage
  exit
fi

config=$1
. $config
project_home=$DATA_DIR/$project
if [ ! -d $project_home ]; then
  git clone $remote_repo $project_home
  cd $project_home
  git remote rm origin
  git remote add origin $local_repo
  git push origin $default_branch
  git push origin --tags
fi
