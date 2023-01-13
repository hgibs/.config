# git abbreviations
abbr g          git
abbr ga         git add
abbr gaa        git add --all
abbr gau        git add --update
abbr gapa       git add --patch
abbr gap        git apply
abbr gb         git branch -vv
abbr gba        git branch -a -v
abbr gban       git branch -a -v --no-merged
abbr gbd        git branch -d
abbr gbD        git branch -D
abbr gbl        git blame -b -w
abbr gbs        git bisect
abbr gbsb       git bisect bad
abbr gbsg       git bisect good
abbr gbsr       git bisect reset
abbr gbss       git bisect start
abbr gc         git commit -v
abbr gc!        git commit -v --amend
abbr gcn!       git commit -v --no-edit --amend
abbr gca        git commit -v -a
abbr gca!       git commit -v -a --amend
abbr gcan!      git commit -v -a --no-edit --amend
abbr gcv        git commit -v --no-verify
abbr gcav       git commit -a -v --no-verify
abbr gcav!      git commit -a -v --no-verify --amend
abbr gcm        git commit -m
abbr gcam       git commit -a -m
abbr gscam      git commit -S -a -m
abbr gcfx       git commit --fixup
abbr gcf        git config --list
abbr gcl        git clone
abbr gclean     git clean -di
abbr gclean!    git clean -dfx
abbr gclean!!   "git reset --hard; and git clean -dfx"
abbr gcount     git shortlog -sn
abbr gcp        git cherry-pick
abbr gcpa       git cherry-pick --abort
abbr gcpc       git cherry-pick --continue
abbr gd         git diff
abbr gdca       git diff --cached
abbr gds        git diff --stat
abbr gdsc       git diff --stat --cached
abbr gdw        git diff --word-diff
abbr gdwc       git diff --word-diff --cached
abbr gdto       git difftool
abbr gignore    git update-index --assume-unchanged
abbr gf         git fetch
abbr gfa        git fetch --all --prune
abbr gfm        "git fetch origin (__git.default_branch) --prune; and git merge FETCH_HEAD"
abbr gfo        git fetch origin
abbr gl         git pull
abbr gll        git pull origin
abbr glr        git pull --rebase
abbr glg        git log --stat
abbr glgg       git log --graph
abbr glgga      git log --graph --decorate --all
abbr glo        git log --oneline --decorate --color
abbr glog       git log --oneline --decorate --color --graph
abbr gloga      git log --oneline --decorate --color --graph --all
abbr glom       git log --oneline --decorate --color \(__git.default_branch\)..
abbr glod       git log --oneline --decorate --color develop..
abbr gloo       "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
abbr gm         git merge
abbr gmt        git mergetool --no-prompt
abbr gmom       git merge origin/\(__git.default_branch\)
abbr gp         git push
abbr gp!        git push --force-with-lease
abbr gpo        git push origin
abbr gpo!       git push --force-with-lease origin
abbr gpv        git push --no-verify
abbr gpv!       git push --no-verify --force-with-lease
abbr ggp!       ggp --force-with-lease
abbr gpu        ggp --set-upstream
abbr gr         git remote -vv
abbr gra        git remote add
abbr grb        git rebase
abbr grba       git rebase --abort
abbr grbc       git rebase --continue
abbr grbi       git rebase --interactive
abbr grbm       git rebase \(__git.default_branch\)
abbr grbmi      git rebase \(__git.default_branch\) --interactive
abbr grbmia     git rebase \(__git.default_branch\) --interactive --autosquash
abbr grbd       git rebase develop
abbr grbdi      git rebase develop --interactive
abbr grbdia     git rebase develop --interactive --autosquash
abbr grbs       git rebase --skip
abbr grev       git revert
abbr grh        git reset
abbr grhh       git reset --hard
abbr grhpa      git reset --patch
abbr grm        git rm
abbr grmc       git rm --cached
abbr grmv       git remote rename
abbr grpo       git remote prune origin
abbr grrm       git remote remove
abbr grs        git restore
abbr grset      git remote set-url
abbr grss       git restore --source
abbr grst       git restore --staged
abbr grup       git remote update
abbr grv        git remote -v
abbr gsh        git show
abbr gsd        git svn dcommit
abbr gsr        git svn rebase
abbr gss        git status -s
abbr gst        git status
abbr gsta       git stash
abbr gstd       git stash drop
abbr gstl       git stash list
abbr gstp       git stash pop
abbr gsts       git stash show --text
abbr gsu        git submodule update
abbr gsur       git submodule update --recursive
abbr gsuri      git submodule update --recursive --init
abbr gts        git tag -s
abbr gtv        git tag | sort -V
abbr gsw        git switch
abbr gswc       git switch --create
abbr gunignore  git update-index --no-assume-unchanged
abbr gup        git pull --rebase
abbr gupv       git pull --rebase -v
abbr gupa       git pull --rebase --autostash
abbr gupav      git pull --rebase --autostash -v
abbr gwch       git whatchanged -p --abbrev-commit --pretty=medium

# git checkout abbreviations
abbr gco        git checkout
abbr gcb        git checkout -b
abbr gcod       git checkout develop
abbr gcom       git checkout \(__git.default_branch\)

# git flow abbreviations
abbr gfb        git flow bugfix
abbr gff        git flow feature
abbr gfr        git flow release
abbr gfh        git flow hotfix
abbr gfs        git flow support

abbr gfbs       git flow bugfix start
abbr gffs       git flow feature start
abbr gfrs       git flow release start
abbr gfhs       git flow hotfix start
abbr gfss       git flow support start

abbr gfbt       git flow bugfix track
abbr gfft       git flow feature track
abbr gfrt       git flow release track
abbr gfht       git flow hotfix track
abbr gfst       git flow support track

abbr gfp        git flow publish

# git worktree abbreviations
abbr gwt        git worktree
abbr gwta       git worktree add
abbr gwtls      git worktree list
abbr gwtlo      git worktree lock
abbr gwtmv      git worktree move
abbr gwtpr      git worktree prune
abbr gwtrm      git worktree remove
abbr gwtulo     git worktree unlock

