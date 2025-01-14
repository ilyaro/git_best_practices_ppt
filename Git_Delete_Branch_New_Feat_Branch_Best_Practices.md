It is best practice to delete branches that were merged!

On many popular git servers, this option can be set by default

Why it is so important to remove merged branches?

It is very simple, merged branched finished its life and now it's commit/s continues to live in the main default branch

It is no longer needed and moreover, it may interfere with you, if you by mistake continue to use the branch! 
Or try to merge it again, it just wastes your time in both cases

What do you need to do: it is to fetch origin/main branch and create a new branch from it
Of course, it may be with the same name as a deleted branch, but it is created from the correct commit! And will not waste your time      

Please use this alias to delete merged and removed remote branches:
 
```bash
alias git-bd='git checkout origin/HEAD;git remote prune origin;git branch --merged | grep -v HEAD | xargs -I{} git branch -d {}'
```
From here: Always delete merged branch on Git server (If you need the commits of the branch  somehow, just tag it before branch deletion)


```bash
## Before you start working on a new feature/bugfix remove all merged branches from your repo
git checkout feat/CLOIS-9356-aks-cp-authorization
git tag MERGED_feat_CLOIS-9356-aks-cp-authorization
git push --tags
git push origin --delete feat/CLOIS-9356-aks-cp-authorization
git-bd
```

```bash
## Start work with the creation of a new feature branch and tag its base commit
## When you start development in new branch from fetched origin/main - default branch:
git fetch origin main
git checkout -b feat/CLOIS-9356-aks-cp-authorization origin/main && git tag BASE_feat_CLOIS-9356-aks-cp-authorization
git push origin BASE_feat_CLOIS-9356-aks-cp-authorization
```
