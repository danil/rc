# Mail

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

    mail -a "Content-type: text/html;" \
         -s "Employer" \
         danil@kutkevich.org < ./htdocs/index.html

    echo 'Hello, work' | mail --subject='Hello, World!' danil@kutkevich.org
    mailq

## Mailserver version

    /usr/sbin/sendmail -bV
    exim -bV

# Exim

    exim -Mvl <message_id>

## Test address

### Route

    exim -bt your.mail@example.org

### Rewrite rules

    exim -brw your.mail@example.org

## Find all address

    exigrep [^@]+@[^.]+\.[^.]+ /var/log/exim/exim_main.log

## Statistics report

    eximstats /var/log/exim/exim_main.log
