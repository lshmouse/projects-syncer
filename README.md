## projects-syncer
Sync projects with the opensource community.

## Adding a project
Add a config file about the project needed to be synced with community.

Basic infos about the projects are:
- project: the name of the project
- local_repo: the private git repo of the project
- remote_repo: the community repo of the project
- branches: all branches to be synced
- default_branch: the default branch of the project 

For an example, see the configs/zookeeper.cfg
```
project=zookeeper
local_repo="git@git.n.xiaomi.com:infra/zookeeper.git"
remote_repo="git://git.apache.org/zookeeper.git"
branches=(trunk branch-3.4 branch-3.5)
default_branch=trunk
```

## Deployment
Clone the projects and add the sync-all.sh script to crontab

```
30 5 * * * cd projects-syncer; bash sync-all.sh > syncr.log 2>&1
```

## Contact
For any problems, you can email: liushaohui@xiaomi.com.
