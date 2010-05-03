<!--*- coding: utf-8; -*-->
Git
===

    git config --global user.name "Danil Kutkevich"
    git config --global user.email danil.kutkevich.org
    git init
    git add .
    git clone --bare git://kutkevich.org/kutkevich-org.git
    git status
    git push origin master
    git pull origin master

[Submodules][]
------------

    git submodule add git://kutkevich.org/rc.git markdown/rc
    git submodule init
    git submodule update

[Submodules]: http://progit.org/book/ru/ch5-8.html

Diff
----

    git diff --color-words --cached
    git diff HEAD^^^ HEAD

Mirror Subversion repository to Git
-----------------------------------

### [With bare][]

[With bare]: https://git.wiki.kernel.org/index.php/GitFaq#How_do_I_mirror_a_SVN_repository_to_git.3F

### Without bare

    git svn init -s http://google-code-prettify.googlecode.com/svn \
        google-code-prettify3
    git config svn.authorsfile .git/authors_file
    git svn fetch

[Migrate Subversion repository to Git][]
--------------------------------------

[Migrate Subversion repository to Git]: http://jonmaddox.com/2008/03/05/cleanly-migrate-your-subversion-repository-to-a-git-repository/

Reset
-----

Undo stupid monkey changes

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
