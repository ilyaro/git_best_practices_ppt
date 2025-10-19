Git Rebase Best practices

``` bash
##First let us squash all or part of commits in my feature branch only to 1 commit, before rebase
$ git checkout feat/HCDEVOPS-777-rebase-demo

# Find common ancestor of main and feature branch
git merge-base main feature-branch

## You will get the base commit SHA1 (Example)
shsdudhsuyagsudbg21324

$ git reset --soft shsdudhsuyagsudbg21324

$ git commit -m "My awsome feature done"

## See all the changes before pushing them
$ git log -p

## Fetch master commits, all branches actualy
$ git fetch origin main

## Rebase on origin/master
$ git rebase origin/main

##Solve conflicts if exists, git add file to set the conflicts resolved, commit, 
git rebase --continue
##On any stage in rebase run: $ git status to see status of rebase
##Push my 1 rebased commit for review, you must use force with push to your feature branch only
### As parent commit of your commit was changed, --force-with-lease better than --force as if remote branch changed do not let you override it
##Need to pull it first   
$ git push --force-with-lease origin
```

[Full schema of rebase work](Git_Rebase_best_practices.pdf)
