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

Remove messages from queue

### By id

Remove one email message by id from queue

    exim -Mrm your_message_id_to_delete

### By sender

Remove all email messages by specific sender address from mail queue

    exiqgrep -i -f sender_email | xargs exim -Mrm

### Remove all

    exim -bp | exiqgrep -i | xargs exim -Mrm

## Test address

### Route

    exim -bt your.mail@example.tld

### Rewrite rules

    exim -brw your.mail@example.tld

## Find all address

    exigrep [^@]+@[^.]+\.[^.]+ /var/log/exim/exim_main.log

## Show message by id

    exim -Mvl <message_id>

## Show body by id

    exim -Mvb <message_id>

## Retry

### Force

Force queue resend

    exim -qf
