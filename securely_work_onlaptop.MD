## "Working on Laptop with code in git repo securely".
In security companies keeping source code on a laptop is prohibited

For security reasons, if the laptop is stolen, the disk can be unencrypted, it is just an issue of time,

The source code of the company can be available for malicious actors.

So what is the solution? 

How to make the work comfortable on the laptop, and the source code will not stay on the laptop?

This is how I use it, I suggest this:

It is my MAC example, the same can be done in Windows and Linux laptops:

## I create RAMdisk, I mount RAM memory as mount point, I can clone git repositories
## to in memory disk
alias RAMDisk="diskutil apfs create $(hdiutil attach -nomount ram://131072000) RAMDisk && touch /Volumes/RAMDisk/.metadata_never_index"
 
## This is my RAM disk in memory
$ df /Volumes/RAMDisk
Filesystem    512-blocks   Used Available Capacity iused     ifree %iused  Mounted on
/dev/disk11s1  131072000 253208 130582920     1%    5227 652914600    0%   /Volumes/RAMDisk
 
## So when I clone repo to it, I can work with git repo sources very fast, as it is RAM
## Comparing to SSD disk even, 10 times faster, and much much more faster than network drive like NAS 
$ pwd
/Volumes/RAMDisk/helm-charts/ctrlplanes-v2/values/cloudia-prod-eu/policy-service
$ g s
On branch feat/HCDEVOPS-1850-policy-service-migrate-to-new-dedicated-neptune
Your branch is up to date with 'origin/feat/HCDEVOPS-1850-policy-service-migrate-to-new-dedicated-neptune'.
 
## Now when the laptop is restarted, or hard disk is extracted and decrypted
## No git repo will be found on disk, so the company security is saved
 
## How do I save my work on RAMDisk in case there is restart of the laptop?
## Well, I commit and push my feature branch every save I did
## This way I follow git best practices to commit as frequently as I can, every save!
## I can always find what I changed in commits
## And all my work is backed up in remote repository in my feature branch, so nothing ever is lost, all is saved
## Here is example for VS code I use, I use plugin "Run on Save", see here how to use it: 
https://github.com/ilyaro/git_best_practices_ppt/blob/master/VSCode/CommitOnSave_VisualStudioCode.md
 
## When I need to open MR, PR for code review, I can push only relevant commits or commit 1
$ git reset --soft origin/master
$ git commit -m "My awsome feature done"
## See all the changes before pushing them
$ git log -p
## Fetch master commits
$ git fetch origin
## Rebase on origin/master
$ git rebase origin/master
## Push my 1 rebased commit for review
$ git push origin
