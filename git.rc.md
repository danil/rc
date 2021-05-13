# Git

    git config --global user.name "John Doe"
    git config --global user.email john@doe.org
    git clone git://your.tld/repository-name.git destination-dir
    git --git-dir=path/to/repository/.git  --work-tree=path/to/repository status
    git push origin master

## Init

    git --bare init

## Add to stage/index

Stage all files

    git add .

## Deleted from stage/index

    git add --update

## Untracked in stage/index

    git add --all

## Commit in the past

    git commit --message="your message" --date="1970-12-34T01:23:45Z"

## Push specific commit

Push one commit by commit sha
<https://stackoverflow.com/questions/3230074/how-can-i-push-a-specific-commit-to-a-remote-and-not-previous-commits#3230241>,
<http://stackoverflow.com/questions/3230074/git-pushing-specific-commit#4512933>

    git push origin your-commit-sha:master

## Push local branch to another remote branch

<https://stackoverflow.com/questions/13897717/push-commits-to-another-branch/13897766#13897766>

    git push your-remote local-branch:remote-branch

## Push all branches

    git push --all origin

## Push to URL across repositories

Push from local repository to independent remote repository
<https://gist.github.com/domenic/ec8b0fc8ab45f39403dd>

    git push git@github.com:your/repo.git local-branch:remote-branch

## Branches lise

    git branch --all

## Create remote branch

    git push origin your-branch-name

## Get current branch

Get/print current branch

    echo $(git rev-parse --abbrev-ref HEAD)

## Branch create and checkout

    git checkout -b newbranch

## Branch delete

    git branch --delete your-branch-name

## Remote branch delete

    git push origin :your-branch-name

### Remote branchs cleanup

    git remote prune origin

## Branch rename

    git branch -m old_branch new_branch

## Rename remote branch

origin/your-new-branch to origin/your-old-branch
<http://stackoverflow.com/questions/1526794/git-rename-remote-branch#answer-1527004>

    git branch -m your-new-branch your-old-branch

## Default branch to pull

<http://stackoverflow.com/questions/658885/how-do-you-get-git-to-always-pull-from-a-specific-branch#answer-659804>

    git config branch.your-branch-name.remote origin
    git config branch.your-branch-name.merge refs/heads/production

## Branch upstream

    git branch --set-upstream-to=origin/your-remoute-branch-name

## Merge abort

    git merge --abort

## Merge without commit

<http://stackoverflow.com/questions/8640887/git-merge-without-auto-commit#8641053>

    git merge --no-commit --no-ff your-branch-name

## Merge pull request step 1

From your project repository, check out a new branch and test the changes.

    git checkout -b contributor-somebranch master
    git pull https://github.com/contributor/your-repository-name.git somebranch

## Merge pull request step 2

Merge the changes and update on upstream.

    git checkout master
    git merge --no-ff contributor-somebranch
    git push origin master

## Checkout in bare repository

<http://stackoverflow.com/questions/3301956/git-correct-way-to-change-active-branch-in-a-bare-repository#3302018>

    git symbolic-ref HEAD refs/heads/you-branch-name

## Checkout/copy directory

Get/copy a directories recursively from a specific revision
<http://stackoverflow.com/questions/9670745/how-to-restore-a-whole-directory-from-history-of-git-repository#9671161>

    git checkout your-branch-name -- path/to/direcotry

## Show/copy file

Get a file from a specific revision
<http://stackoverflow.com/questions/610208/how-to-retrieve-a-single-file-from-specific-revision-in-git#answer-610315>.

    git show HEAD^^^:path/to/file.txt > local/path/to/file.txt

## Remote remove

    git remote remove github

## Remote add

    git remote add origin ssh://john@doe.org/var/git/repository-name.git

## Second remote adding

    git remote add github git@github.com:path/to/repository-name.git

## Remote branchs cleanup

    git remote prune origin

## Copy file from branch to another

<http://stackoverflow.com/questions/307579/how-do-i-copy-a-version-of-a-single-file-from-one-git-branch-to-another#answer-307872>.
A la restore deleted file
<http://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo#answer-1113140>.

    git checkout your-otherbranch-name in/current/branch/path/to/file.txt

## Tag list

    git tag

## Remote tags list

    git ls-remote --tags https://your.tld/path/to/repo.git

## Checkout to tag

Select tag <http://git-scm.com/book/en/Git-Basics-Tagging#Listing-Your-Tags>

    git checkout v0.0.1

## Latest/newest tag

Newest tag
<http://stackoverflow.com/questions/1404796/how-to-get-the-latest-tag-name-in-current-branch-in-git#7261049>

    git describe --abbrev=0 --tags

## Latest tagged commit

<http://stackoverflow.com/questions/1404796/how-to-get-the-latest-tag-name-in-current-branch-in-git#7979255>

    git rev-list --tags --max-count=1

## Tag create

<http://git-scm.com/book/en/Git-Basics-Tagging#Lightweight-Tags>

    git tag v0.0.1 HEAD^

## Push all tags to remote

<http://stackoverflow.com/questions/4061481/git-push-tag-master#4061529>

    git push --tags your-remote-name

## Tag delete

    git tag --delete v0.0.1

## Delete remote tag

<http://www.abeautifulsite.net/how-to-delete-a-tag-on-github/>

    git push origin :v0.0.1

## Tags cleanup

Remove local tags thats deleted on remote

    git tag -l | xargs git tag -d && git fetch -t

## Stash

    git stash save 'your stash description message'
    git pop
    git apply
    git stash show --patch

## Stash specific file in the first way

<http://stackoverflow.com/questions/5506339/how-can-i-git-stash-a-specific-file/5506483#answer-5506483>.

    git stash --patch

`d` to skip, `a` to stash, and then `q` to quit.

## Stash specific file in the second way

<http://stackoverflow.com/questions/3040833/git-how-to-stash-only-one-file-out-of-multiple-files-that-have-changed#8333163>.

This will stash everything that you haven't previously added. Just git
add the things you want to keep, then run it.

    git stash --keep-index

## Show stashed file

<http://stackoverflow.com/questions/1105253/how-would-i-extract-a-single-file-or-changes-to-a-file-from-a-git-stash#1105666>

    git show stash@{0}:README.md

## Fetch

    git fetch origin master
    git merge origin/master

equal to

    git pull origin master

## Fetch all branches

<http://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches#10312587>

    git fetch --all

## rev-list count commits

Count number of commits per file
<http://stackoverflow.com/questions/25850117/how-to-count-number-of-commits-per-file-pathname-by-author-in-a-git-repository#27386471>

    git rev-list HEAD --count path/to/file

## Move

Move file and directory into a other directory along with commit history

    git mv your/dir1/* your/dir2

## Mirror repository

<http://exyr.org/2011/git-mirrors>

    git clone --mirror git://github.com:your/repo.git
    git remote add your-remote-name you@your.host.tld:your/repo.git
    git push --mirror your-remote-name # push all branches

### Mirror repository yet another way

<http://toolmantim.com/thoughts/setting_up_a_new_remote_git_repository>

    git clone --bare git://github.com:your/repo.git
    git remote add origin git://github.com:your/repo.git
    git fetch

## Convert to bare

* <https://git.wiki.kernel.org/index.php/GitFaq#How_do_I_make_existing_non-bare_repository_bare.3F>
* <http://stackoverflow.com/questions/2199897/how-to-convert-a-normal-git-repository-to-a-bare-one#2200662>

    mv repo/.git repo.git
    git --git-dir=repo.git config core.bare true
    rm -rf repo

## Submodule setup

<http://progit.org/book/ru/ch5-8.html>

```sh
git submodule add git@github.com:your/repo.git local/path
git submodule init
git submodule update
git submodule status
```

## Submodule recursive init & update

    git submodule update --init --recursive

## Find submodules

Find submodules even not listed in `.gitmodules` file

    git ls-files --stage | grep 160000

## Submodule remove

<http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule#1260982>

* Delete the relevant line from the `.gitmodules`
* Delete the relevant section from `.git/config`
* Delete the relevant directory from `.git/modules/path_to_submodule`

    git rm --cached path_to_submodule
    git submodule sync path_to_submodule
    git submodule deinit path_to_submodule

## Diff

    git diff --cached --color-words
    git diff --color HEAD^..HEAD path/to/your/file.name

## Diff and List changed file names

    git diff HEAD^ HEAD --name-only

## diffstat of binary files

    git diff --stat public/images/article_pics/1.jpg

## Diff between two branches

<http://stackoverflow.com/questions/822811/differences-in-git-branches#answer-822859>

    git diff --name-status production..master

## Diff: count lines added/removed/changed lines in stage/index

    git diff --cached --stat

## Pager less

Use custom pager `less`:

    GIT_PAGER='less --chop-long-lines --IGNORE-CASE --LINE-NUMBERS' git diff

## Without pager

Prevent git diff from using a pager
<http://stackoverflow.com/questions/136178/git-diff-handling-long-lines#152546>

    GIT_PAGER='' git diff

## Mirror subversion repository to git with bare

<https://git.wiki.kernel.org/index.php/GitFaq#How_do_I_mirror_a_SVN_repository_to_git.3F>

## Mirror subversion repository to git without bare

    git svn init -s http://google-code-prettify.googlecode.com/svn \
        google-code-prettify
    cd google-code-prettify; git config svn.authorsfile .git/authors_file
    git svn fetch

## Migrate Subversion repository to Git

<http://jonmaddox.com/2008/03/05/cleanly-migrate-your-subversion-repository-to-a-git-repository/>

You have three steps there:

### Temporary repository

    git svn init --no-metadata \
      svn+ssh://li42-44.members.linode.com/var/svn/ska/skaonrails/trunk \
      skaonrails_tmp
    cd skaonrails_tmp; git config svn.authorsfile ~/tmp/authors_file_ska
    git svn fetch

#### Get all Subversion commit usernames

<http://stackoverflow.com/questions/2494984>

    svn log --quiet |awk '/^r/ {print $3}' |sort -u > ~/tmp/authors_file_ska

### Clone from temporary repository

    git --bare clone skaonrails_tmp skaonrails.git

### Push to Gitorious

<http://gitorious.org/about/faq>

    git push git@gitorious.org:ska/skaonrails.git master

## Migrate CVS to Git

    git cvsimport -k -d :ext:barm@ssh.barm.nichost.ru:/home/barm/cvsroot \
                  -A ~/tmp/authors_file -C to_dir johnstudio/barmadmin

* `man gitcvs-migration`
* `man git-cvsimport`
* <http://www.chem.helsinki.fi/~jonas/git_guides/HTML/CVS2git>

## Undoing in Git - Reset, Checkout and Revert

<http://book.git-scm.com/4_undoing_in_git_-_reset,_checkout_and_revert.html>

### Fixing un-committed mistakes

<http://stackoverflow.com/questions/7723037/git-checkout-delete-directory#7723128>

    git checkout HEAD -- app/views/homepages/index.en.html

### Correct commit message

<http://stackoverflow.com/questions/179123/how-do-i-edit-an-incorrect-commit-message-in-git>

    git commit --amend -m "Your new message"

### Correct commit date

<http://stackoverflow.com/questions/454734/how-can-one-change-the-timestamp-of-an-old-commit-in-git#answer-5017265>

    git commit --amend --date="Wed Feb 16 14:00 2011 +0400"

### Work tree

#### Reset index

    git reset file1 file2
    git reset # Reset whole index.

#### Reset commit

<http://stackoverflow.com/questions/927358/git-undo-last-commit#answer-927386>

    git reset --soft HEAD^

#### Reset initial commit

<http://stackoverflow.com/questions/6632191/how-to-revert-initial-git-commit#6637891>

    git update-ref -d HEAD

##### Hard

"Жёсткий" реcет (следует использовать с осторожностью) вернет дерево
проекта и индекс в состояние, соответствующее указанному коммиту,
удалив изменения последующих коммитов.

    git reset --hard HEAD~1

#### Revert

    git revert --no-commit HEAD^^^..HEAD^^

### Bare repository

[Git reset allow soft in a bare repo](http://kerneltrap.org/mailarchive/git/2007/7/14/251527)

    git reset --soft HEAD~1

## Patch

### Easy way

    sed --in-place 's/foo/bar/g' path/to/file.c
    git diff > path/to/1.patch
    git add .
    sed --in-place 's/baz/xyz/g' path/to/file.c
    git diff > path/to/2.patch
    git add .
    git reset --hard HEAD
    git apply path/to/1.patch
    git apply path/to/2.patch

### Hard way

<http://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git>

    git format-patch HEAD^..HEAD --stdout > your_patch_name.patch
    git apply --stat your_patch_name.patch
    git apply --check your_patch_name.patch
    git am --reject your_patch_name.patch
    git am --abort

## Cherry-pick

    git cherry-pick 92117a11fdfdb75a72dd8d3f1c5f25800e827589

## Continue

    git cherry-pick --continue

### Abort

    git cherry-pick --abort

## Rebase

### Squash latest commits into one

Reduce repository size
<https://stackoverflow.com/questions/598672/squash-the-first-two-commits-in-git#598788>

    git rebase --interactive --root HEAD
    git rebase --continue

### Other1

    git fetch
    git rebase --keep-empty

### Conflict

#### Continue

    git add .
    git rebase --continue

#### Abort

    git rebase --abort

### Other2

    git checkout foobar
    git branch foobar-for-rebase
    git rebase --onto production master foobar-for-rebase
    git checkout production
    git merge foobar-for-rebase
    git branch -D foobar-for-rebase

## Find not commited changes

    for P in $(find /home/danil/ -mount -type d -name ".git" -exec echo '{}' \; \
               |sed -e 's/\.git//' ) ; do \
        echo "$P" ; \
        git --git-dir="$P.git" --work-tree="$P" status --short ; \
    done

## Log

    git log --reverse
    git log --patch --no-merges  HEAD^^^ HEAD

### By date

    git log --since="1 day 2 hours"
    git log --after=2013-06-07

### By authors

<http://stackoverflow.com/questions/4259996/how-can-i-view-a-git-log-of-just-one-users-commits#4262780>.

    git log --author='\(mikhail\|danil\)'

### By file type

    git log -- '*.txt'

### Git tree in terminal

<http://stackoverflow.com/questions/1064361/unable-to-show-a-git-tree-in-terminal#5354644>.

    git log --color --graph --decorate --pretty=oneline --abbrev-commit

### File name

List of the changed file names

<http://stackoverflow.com/questions/14207414/how-to-show-changed-file-name-only-with-git-log#14227496>

```sh
git log --name-only
git log --stat
```

### Files changed by author

List all file names changed by author
<https://stackoverflow.com/questions/6349139/can-i-get-git-to-tell-me-all-the-files-one-user-has-modified#6349405>

```sh
git log --pretty="%H" --author="your_name" app/models | while read commit_hash; do git show --oneline --name-only $commit_hash | tail -n+2; done | sort | uniq | grep 'app/models'

git log --pretty="%H" --author="your_author_name" your/path | \
    while read commit_hash; do \
          git show --oneline --name-only $commit_hash | \
          tail -n+2; \
    done | \
    sort | uniq | grep "your/path"
```

### Search commit message

<http://stackoverflow.com/questions/7124914/how-to-search-a-git-repository-by-commit-message#7124949>

    git log --grep='your-desired-feature'

### Search file in all commits

Search file name in all commits history
<http://stackoverflow.com/questions/7203515/how-to-locate-a-deleted-file-in-the-commit-history#7203551>

    git log --all -- path/to/your/file.name

### Other

<http://stackoverflow.com/questions/949314/how-to-retrieve-the-hash-for-the-current-commit-in-git>
<http://stackoverflow.com/questions/2798822/can-i-get-git-log-to-print-the-history-in-reverse-order>
<http://stackoverflow.com/questions/1251999/sed-how-can-i-replace-a-newline-n>

```sh
git log \
    --after="Mon Jun 10 19:48:47 2013 +0400" \
    --pretty=format:'%h' --no-merges --reverse \
    | sed ':a;N;$!ba;s/\n/ /g'
```

## Shortlog

### Contributors

#### List

List of contributors/authors

* <http://stackoverflow.com/questions/9597410/list-all-developers-on-project-in-git#9597462>
* <http://www.commandlinefu.com/commands/view/4519/list-all-authors-of-a-particular-git-project>

    git shortlog --summary --email --numbered --since="7 days ago" path/to/file | cut -c8-

#### Count

Count contributors to file:

* <http://stackoverflow.com/questions/9597410/list-all-developers-on-project-in-git#9597462>
* <http://www.commandlinefu.com/commands/view/4519/list-all-authors-of-a-particular-git-project>

    git shortlog --summary --email path/to/file | wc --lines

## History of a file

<http://stackoverflow.com/questions/278192/git-how-do-i-view-the-change-history-of-a-file>

    gitk app/controllers/accounting/addresses_controller.rb
    git log --patch app/controllers/accounting/addresses_controller.rb

## grep

    git grep -e 'first' --and -e 'another'

### Search through all commits

Search through all commits (and all branches)
<http://stackoverflow.com/questions/2928584/how-to-grep-in-the-git-history#answer-2929502>

    git grep 'TODO' $(git rev-list --all)

## Restore deleted file without commit

<http://stackoverflow.com/questions/1843577/how-to-restore-deleted-file#1843584>

    git checkout HEAD .config/compiz-1/compizconfig/Default.ini

## Clean working repository

<https://stackoverflow.com/questions/2116778/reduce-git-repository-size#2116892>a

    git gc --prune=now --aggressive

## Clean working tree

Remove untracked files from the working tree

    git clean --force

## Bisect

Binary Search <http://progit.org/book/ru/ch6-5.html>.

    git bisect start
    git bisect bad
    git bisect good v1.0
    ...
    git stash
    git bisect reset
    git stash pop

## Search filenames

    git ls-tree -r HEAD | grep fetcher_log
    git ls-tree -r --name-only master |grep -i public/stylesheets/.*doc.*css

## Remove/delete

    git rm file1 \*.md

### Remove/delete from git, working tree files will be left alone

    git rm --cached .config/gajim/config

## Subtree

Deploy to GitHub Pages <http://yeoman.io/learning/deployment.html>

    git add --update foobar/ && git commit -m 'deploy'
    git push origin :gh-pages && git subtree push --prefix foobar origin gh-pages

## Reflog

Find reseted commit (no longer are being pointed to by some other ref):

    git reflog --pretty=fuller --color -p --author=your_user --since="1 hours"

## Merge repositories

Merge two repositories with history
<http://stackoverflow.com/questions/1425892/how-do-you-merge-two-git-repositories#1426163>.

    git clone /var/git/foo.git
    git remote add --fetch bar /var/git/bar.git
    git merge --no-ff --no-commit
              --strategy=recursive \
              --strategy-option=ours \
               bar/master
    git commit --message='Merge branch v0.0.1 into v0.0.2'

## Change the default git branch in a bare repository

Setting/changing the default git branch in a bare repository
<https://stackoverflow.com/questions/3301956/git-correct-way-to-change-active-branch-in-a-bare-repository#3302018>

    git symbolic-ref HEAD refs/heads/your-branch

## Commit messages

<http://karma-runner.github.io/0.8/dev/git-commit-msg.html>
<http://seesparkbox.com/foundry/semantic_commit_messages>

* `chore` updating grunt tasks etc; no production code change
* `docs` changes to documentation
* `feat` new feature
* `fix` bug fix
* `refactor` refactoring production code
* `style` formatting, missing semi colons, etc; no code change
* `test` adding missing tests, refactoring tests; no production code change

## Git Daemon

<https://git-scm.com/book/gr/v2/Git-on-the-Server-Git-Daemon>

`git-daemon-export-ok`

## Git flow

    git flow init
    git flow feature start feat-1234-your-feature-name
    git commit --message="feat: some commit"
    git flow feature finish feat-1234-your-feature-name

## Other

    git mv oldname newname
    git ls-files
    git commit --message="Some commit."
    git cat-file blob HEAD^:htdocs/bookmarks/index.md
    git fsck
    git blame production ~/src/vendor/avers/prohq/app/views/layouts/project.html.haml
