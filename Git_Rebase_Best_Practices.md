Git Rebase on default branch origin/main - Best Practices

``` bash
## First, let us squash all or part of commits in my feature branch only to 1 commit, before rebase
$ git checkout feat/HCDEVOPS-777-rebase-demo

# Find common ancestor of origin/main and your feature branch
$ git merge-base origin/main feat/HCDEVOPS-777-rebase-demo

## You will get the base commit SHA1 (Example)
## The commit you created your branch feat/HCDEVOPS-777-rebase-demo from
2249f5a2a6a34575b2e81363a58d6a2d0be08576

## Now let us squash all commits to 1 commit for easy rebase
## reset --soft brings the feat/HCDEVOPS-777-rebase-demo branch to point to common ancestor with origin/main commit and leaves all the changes in the branch in index for 1 commit 
$ git reset --soft 2249f5a2a6a34575b2e81363a58d6a2d0be08576

## Now create 1 commit all all work in the branch 
$ git commit -m "rebase demo: 1 commit squash of all work in branch"

## See all the changes before pushing them
$ git log -p

## Fetch default branch commits from remote repo
$ git fetch origin main

## Rebase on origin/main 
## Only 1 commit will be rebased, otherwise all commits in the branch will be rebased 1 by 1 on origin/main (It may be 50 commits to rebase, including 50 conflict resolutions)
$ git rebase origin/main

## Solve conflicts if they exist, just open the conflict file in the IDE or editor
## Add the file to the index (stage) to set the conflicts resolved!
$ git add <Conflict file>

## Now continue with rebase
$ git rebase --continue

## On any stage in rebase run: git status, to see status of the rebase
$ git status

## Push your 1 rebased commit for review, you must use --force-with-lease with push to your feature branch only
### As parent commit of your commit was changed, --force-with-lease better than --force as if remote branch changed do not let you override it
##Need to pull it first   
$ git push --force-with-lease origin
```

[Full schema of rebase work](Git_Rebase_best_practices.pdf)
