How to configure autocmd BufWritePost git commit on file chnage in vi or vim

## vim or vi how to configure commit on each save :w
## git commit file on save if in git repository - see .vimrc file
:autocmd BufWritePost * !git ls-files --error-unmatch % && git commit -m "`git diff -U0 % | tail -1`" %
##View the auto-command with:
:autocmd BufWritePost *

##And remove all auto-commands from the previous with:
:autocmd! BufWritePost *