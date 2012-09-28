<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Git
===

    git config --global user.name "Danil Kutkevich"
    git config --global user.email danil@kutkevich.org
    git init
    git add .
    git clone git://kutkevich.org/rc.git foobar
    git --git-dir=/home/danil/src/rc/.git --work-tree=/home/danil/src/rc status
    git push origin master
    git pull origin master

Branching and Merging
---------------------

<http://book.git-scm.com/3_basic_branching_and_merging.html>

    git checkout production
    git branch -a
    git merge production
    git branch breadcrumbs-1423

<http://stackoverflow.com/questions/658885/how-do-you-get-git-to-always-pull-from-a-specific-branch#answer-659804>

    git config branch.breadcrumbs-1423.remote origin
    git config branch.breadcrumbs-1423.merge refs/heads/production

    git branch -d breadcrumbs-1423

### Rename

    git branch -m old_branch new_branch

#### Remote branch

origin/master to origin/master-old
<http://stackoverflow.com/questions/1526794/git-rename-remote-branch#answer-1527004>

    git branch -m master master-old

Delete master
    git push origin :master

Create master-old on remote
    git push origin master-old

### Delete remoute branch

    git push origin :accounting

Copy file from branch to another
--------------------------------

<http://stackoverflow.com/questions/307579/how-do-i-copy-a-version-of-a-single-file-from-one-git-branch-to-another#answer-307872>.
A la restore deleted file
<http://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo#answer-1113140>.

    git checkout r2 app/views/shared/_info_blocks.haml

Tag
---

    git tag -l
    git checkout <tag_name>

Stash
-----

    git stash
    git pop
    git apply
    git stash show --patch

### Stash specific file

Several ways to achieve this:

#### First

<http://stackoverflow.com/questions/5506339/how-can-i-git-stash-a-specific-file/5506483#answer-5506483>.

    git stash --patch

`d` to skip, `a` to stash, and then `q` to quit.

#### Second

<http://stackoverflow.com/questions/3040833/git-how-to-stash-only-one-file-out-of-multiple-files-that-have-changed#8333163>.

This will stash everything that you haven't previously added. Just git
add the things you want to keep, then run it.

    git stash --keep-index

Mirror Git repository
---------------------

<http://toolmantim.com/thoughts/setting_up_a_new_remote_git_repository>

    git clone --bare git://github.com/sebnow/lake.git
    git remote add origin git://github.com/sebnow/lake.git
    git fetch


### Adding second remote

    git remote add github git@github.com:danil/ruby-mode.git

Submodules
----------

<http://progit.org/book/ru/ch5-8.html>

    git submodule add git://kutkevich.org/rc.git markdown/rc
    git submodule init
    git submodule update

Remove submodule
----------------

<http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule>

* Delete the relevant line from the `.gitmodules`
* Delete the relevant section from `.git/config`

Diff
----

    git diff --cached --color-words
    git diff HEAD^^^ HEAD

### diffstat of binary files

    git diff --stat public/images/article_pics/1.jpg

### Between two branches

<http://stackoverflow.com/questions/822811/differences-in-git-branches#answer-822859>

    git diff --name-status production..master

Mirror Subversion repository to Git
-----------------------------------

### With bare

<https://git.wiki.kernel.org/index.php/GitFaq#How_do_I_mirror_a_SVN_repository_to_git.3F>

### Without bare

    git svn init -s http://google-code-prettify.googlecode.com/svn \
        google-code-prettify
    cd google-code-prettify; git config svn.authorsfile .git/authors_file
    git svn fetch

Migrate Subversion repository to Git
------------------------------------

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

Migrate CVS to Git
------------------

    git cvsimport -k -d :ext:barm@ssh.barm.nichost.ru:/home/barm/cvsroot \
                  -A ~/tmp/authors_file -C to_dir johnstudio/barmadmin

* `man gitcvs-migration`
* `man git-cvsimport`
* <http://www.chem.helsinki.fi/~jonas/git_guides/HTML/CVS2git>

Undoing in Git - Reset, Checkout and Revert
-------------------------------------------

<http://book.git-scm.com/4_undoing_in_git_-_reset,_checkout_and_revert.html>

### Fixing un-committed mistakes

    git checkout -- app/views/homepages/index.en.html

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

##### Hard

"Жёсткий" реcет (следует использовать с осторожностью) вернет дерево
проекта и индекс в состояние, соответствующее указанному коммиту,
удалив изменения последующих коммитов.

    git reset --hard HEAD~1

#### Revert

    git revert -n HEAD^^^..HEAD^^

### Bare repository

[Git reset allow soft in a bare repo](http://kerneltrap.org/mailarchive/git/2007/7/14/251527)

    git reset --soft HEAD~1

Patch
-----

<http://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git>

    git format-patch HEAD^..HEAD --stdout > guarantee-with-admin.patch
    git apply --stat guarantee-with-admin.patch
    git apply --check guarantee-with-admin.patch
    git am --reject guarantee-with-admin.patch
    git am --abort

Rebase
------

    git checkout guarantee-with-admin
    git branch guarantee-with-admin-for-rebase
    git rebase --onto production master guarantee-with-admin-for-rebase
    git checkout production
    git merge guarantee-with-admin-for-rebase
    git branch -D guarantee-with-admin-for-rebase

Find not commited changes
-------------------------

    for P in $(find /home/danil/ -mount -type d -name ".git" -exec echo '{}' \; \
               |sed -e 's/\.git//' ) ; do \
        echo "$P" ; \
        git --git-dir="$P.git" --work-tree="$P" status --short ; \
    done

Log
---

    git log --reverse
    git log --patch --since="1 day 2 hours" README
    git log --author="Danil" HEAD^^^ HEAD

### Git tree in terminal

<http://stackoverflow.com/questions/1064361/unable-to-show-a-git-tree-in-terminal#5354644>.

    git log --graph --decorate --pretty=oneline --abbrev-commit

History of a file
-----------------

<http://stackoverflow.com/questions/278192/git-how-do-i-view-the-change-history-of-a-file>

    gitk app/controllers/accounting/addresses_controller.rb
    git log --patch app/controllers/accounting/addresses_controller.rb

grep
----

    git grep -e 'first' --and -e 'another'

### Search through all commits

<http://stackoverflow.com/questions/2928584/how-to-grep-in-the-git-history#answer-2929502>

    git grep 'TODO' $(git rev-list --all)

Show
----

Get a file from a specific revision
<http://stackoverflow.com/questions/610208/how-to-retrieve-a-single-file-from-specific-revision-in-git#answer-610315>.

    git show HEAD^^^:lib/paginable_by_date.rb > lib/paginable_by_date.rb

Bisect
------

Binary Search <http://progit.org/book/ru/ch6-5.html>.

    git bisect start
    git bisect bad
    git bisect good v1.0
    ...
    git stash
    git bisect reset
    git stash pop

Search filenames
----------------

    git ls-tree -r HEAD | grep fetcher_log
    git ls-tree -r --name-only master |grep -i public/stylesheets/.*doc.*css

Rremove
-------

    git rm file1 \*.md

### Remove from git, working tree files will be left alone

    git rm --cached .config/gajim/config

Other
-----

    git mv oldname newname
    git ls-files
    git commit -a -m 'Some commit.'
    git cat-file blob HEAD^:htdocs/bookmarks/index.md
    git remote add origin ssh://danil@kutkevich.org/var/git/kutkevich-org.git
    git fsck
    git cherry-pick 92117a11fdfdb75a72dd8d3f1c5f25800e827589
    git blame production ~/src/vendor/avers/prohq/app/views/layouts/project.html.haml
