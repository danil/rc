<!-- -*- coding: utf-8; -*- -->

Mail
====

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

    mail -a "Content-type: text/html;" \
         -s "Employer" \
         danil@kutkevich.org < ./htdocs/index.html

    echo 'Hello, work' | mail -s 'Hello, World!' danil@kutkevich.org
    mailq

Mailserver version
------------------

    /usr/sbin/sendmail -bV
    exim -bV

Exim
----

    exim -brw danil
    exim -Mvl <message_id>
