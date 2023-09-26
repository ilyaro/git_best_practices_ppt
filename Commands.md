## We will work on this demo project
 
https://github.com/ilyaro/git_best_practices_demo

## Work with local feature branches (topics)
git branch topic/demo_gh
git checkout topic/demo_gh 
git log  - to show initial status

## Edit test7.txt command to run automatically, after save (commits the change of current file with git diff in commit mesage)
## Change 1 line - save
## Add 1 line - save
## Delete 1 line - save
## In the file test7.txt
## It will create 3 commits

## Tag important commit (working commits) after several commits
git tag working1 

## Log with diff with only change, Hash and refs 
git log -c -U0 --pretty="format:%H%d"

## set alias for git log with diff
git config --global --add alias.ld log -c -U0 --pretty="format:%H%d"

## Reset to "working" commit
git reset --hard 9e73c8948a1b7b6630d7eee9546238edb96cc147

## Squash commits
git rebase -i origin/master

## Squash all commits by reset --soft and commit
git reset --soft cfc8db6e487ed835d548c9a7d8e06d179f07ea4e
git commit -m "changes in demo for github user group"

## Let us return all our origin commits 
git reflog
git reset --hard 782d674

## Squash in merge from feature branch to master
## See what to merge with git log --graph
git log --oneline --graph --all
## checkout to branch master
git checkout master
## merge --squash from topic/demo_gh
git merge --squash topic/demo_gh
## now commit 1 squashed merge commit to master
git commit 
git log --oneline --graph --all

## Delete merged and pushed branch topic/demo_gh just to be sure will not commit on it
## Push master branch
git push -u origin master
## First tag it for reference
git tag demo_gh1 topic/demo_gh
## Delete local branch 
git branch -D topic/demo_gh
## See log again
git log --oneline --graph --all
