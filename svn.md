# Subversion

    svnadmin create --fs-type fsfs /var/lib/svn/gamecard
    svn list svn+ssh://var/lib/svn/hello_rails/trunk/
    svn import -m "Initial import." --no-ignore ~/src/hello_world \
               svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk
    svn checkout svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk \
                 hello_rails
    svn checkout \
        svn+ssh://hc-ska.ru/home/ska/var/lib/svn/ska/trunk@202 test1
    svn mkdir -m "Making a new dir." \
              file:///home/danil/var/lib/svn/kutkevich/trunk
    svn add foo.c bar.c
    svn add -N foobar
    svn propset svn:keywords "Date Revision Author HeadURL" foo.c
    svn commit -m "Initial commit." ./
    svn copy trunk/ tags/0.0.1
    svn move -m "move dir." \
             file:///var/lib/svn/kutkevich/danil@kutkevich/danil \
             file:///var/lib/svn/kutkevich/danil@kutkevich/trunk/home/
    svn delete -m "Delete dir." \
               file:///var/lib/svn/kutkevich/danil@kutkevich/trunk/home
    svn log -r 199:230 --verbose \
            svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk/dir
    svn log --verbose svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk/foo@34
    svn log --verbose --stop-on-copy \
        svn+ssh://danil@beta.hc-ska.ru/home/ska/var/lib/svn/ska/skaonrails/branches/0.0.2/
    svn log -v| sed -n '/danil/,/-----$/ p'
    svn -r 228:256 merge \
        svn+ssh://danil@beta.hc-ska.ru/home/ska/var/lib/svn/ska/skaonrails/branches/0.0.2/
    svn propset svn:externals \
      "rails http://dev.rubyonrails.org/svn/rails/trunk" vendor
    svn up vendor
    svn propget svn:externals vendor
