<!--*- coding: utf-8; -*-->
Git
===

    git config --global user.name "Danil Kutkevich"
    git config --global user.email danil.kutkevich.org
    git init
    git add .
    git clone --bare --shared ssh://danil@kutkevich.org/var/git/kutkevich-org.git
    git reset file1 file2
    git reset # Reset whole index.

"Жёсткий" реcет (следует использовать с осторожностью) вернет дерево
проекта и индекс в состояние, соответствующее указанному коммиту,
удалив изменения последующих коммитов:

    git reset --hard HEAD~1

    git mv oldname newname
    git rm file1 \*.md
    git status
    git ls-files
    git commit -a -m 'Some commit.'
    git cat-file blob HEAD^:htdocs/bookmarks/index.md
    git remote add origin git@github.com:danil/test.git
    git push origin master
    git pull origin master
    git branch
    git branch new-feature
    git checkout new-feature
    git branch -d new-branch
    git merge new-feature
    git log -p --since="1 day 2 hours" README
    git grep -e 'first' --and -e 'another'
    git diff --color-words HEAD^^^ HEAD
    git fsck
