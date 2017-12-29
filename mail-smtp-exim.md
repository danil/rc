# Mail

## Send by smtp

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

    mail -a "Content-type: text/html;" \
         -s "Employer" \
         danil@kutkevich.org < ./htdocs/index.html

    echo 'Hello, work' | mail --subject='Hello, World!' danil@kutkevich.org

## Mailserver version

    /usr/sbin/sendmail -bV
    exim -bV

# SMTP

## swaks

`net-mail/swaks` command line smtp testing, including tls and auth
<http://jetmore.org/john/code/swaks/>

    swaks --auth \
          --server your.smtp.domain \
          --auth-user your-login \
          --auth-password your-password \
          --to your@mail.address \
          --h-Subject: "Hello" \
          --body 'World'

# Exim

## Status

Statistics report

    exiwhat
    eximstats /var/log/exim/exim_main.log

## Queue

Messages queue 

### Count

Messages count

    mailq
    exim -bpc

### List

Messages list

    exim -bp
    exim -bp | exiqsumm

### Delete

### By id

Remove one email message by id

    exim -Mrm your_message_id_to_delete

### By sender

Remove all email message from specific sender address

    exiqgrep -i -f sender_email | xargs exim -Mrm

## Test address

### Route

    exim -bt your.mail@example.org

### Rewrite rules

    exim -brw your.mail@example.org

## Find all address

    exigrep [^@]+@[^.]+\.[^.]+ /var/log/exim/exim_main.log

## Other

    exim -Mvl <message_id>