" Commit on each save :w
" if in git repository, if the being saved file is part of the repo,
" generate AI commit message via Copilot CLI, fallback to filename,
" if current branch is not the default branch - push it
autocmd BufWritePost * !git rev-parse --is-inside-work-tree >/dev/null 2>&1 &&
\ git ls-files --error-unmatch % >/dev/null 2>&1 &&
\ git add % &&
\ git commit -m "$(git diff --cached -U3 % | copilot -p 'Write a one-line conventional commit message for this diff. Output ONLY the message, nothing else.' 2>/dev/null || echo 'auto: update %')" % &&
\ git symbolic-ref --short refs/remotes/origin/HEAD | grep -v $(git branch --show-current) > /dev/null 2>&1 && git push
" Not to add end of file automatically
set nofixendofline
" replace tab with spaces
set expandtab
" 4 chars tab
set ts=4 sw=4
" syntax text
syntax on
