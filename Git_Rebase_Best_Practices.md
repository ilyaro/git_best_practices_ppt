###Git Rebase Best practices


##First let us squash all or part of commits in my feature branch only to 1 commit, before rebase
$ git checkout feat/HCDEVOPS-777-rebase-demo
reset my feat branch back to point to origin/master and --soft means leave all files I committed in working tree in modified state in index(stage) ready for commit  
$ git reset --soft origin/master
$ git commit -m "My awsome feature done"
## See all the changes before pushing them
$ git log -p
## Fetch master commits, all branches actualy
$ git fetch origin
## Rebase on origin/master
$ git rebase origin/master
Solve conflicts if exists, git add file to set the conflicts resolved, commit, git rebase --continue
On any stage in rebase run: $ git status to see status of rebase
Push my 1 rebased commit for review, you must use force with push to your feature branch only
### As parent commit of your commit was changed, --force-with-lease better than --force as if remote branch changed do not let you override it
Need to pull it first   
$ git push --force-with-lease origin

[Full schema of rebase work]Git_Rebase_best_practices.pdf](Git_Rebase_best_practices.pdf)
