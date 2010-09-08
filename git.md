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
    git clone git://kutkevich.org/kutkevich-org.git
    git status
    git push origin master
    git pull origin master

Mirror Git repository
---------------------

<http://toolmantim.com/thoughts/setting_up_a_new_remote_git_repository>

    git clone --bare git://github.com/sebnow/lake.git
    git remote add origin git://github.com/sebnow/lake.git
    git fetch

Submodules
----------

<http://progit.org/book/ru/ch5-8.html>

    git submodule add git://kutkevich.org/rc.git markdown/rc
    git submodule init
    git submodule update

Diff
----

    git diff --color-words --cached
    git diff HEAD^^^ HEAD

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

### Work tree

#### Reset index

    git reset file1 file2
    git reset # Reset whole index.

#### Reset commit

"Жёсткий" реcет (следует использовать с осторожностью) вернет дерево
проекта и индекс в состояние, соответствующее указанному коммиту,
удалив изменения последующих коммитов.

    git reset --hard HEAD~1

### Bare repository

[Git reset allow soft in a bare repo](http://kerneltrap.org/mailarchive/git/2007/7/14/251527)

    git reset --soft HEAD~1

Other
-----

    git mv oldname newname
    git rm file1 \*.md
    git ls-files
    git commit -a -m 'Some commit.'
    git cat-file blob HEAD^:htdocs/bookmarks/index.md
    git remote add origin ssh://danil@kutkevich.org/var/git/kutkevich-org.git
    git branch
    git branch new-feature
    git checkout new-feature
    git branch -d new-branch
    git merge new-feature
    git log -p --since="1 day 2 hours" README
    git grep -e 'first' --and -e 'another'
    git fsck
