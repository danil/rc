# Exim

## Status

Statistics report

    exiwhat
    eximstats /var/log/exim/exim_main.log

## Queue messages count

    mailq
    exim -bpc

## Queue messages list

    exim -bp
    exim -bp | exiqsumm

## Delete/remove on message from queue by id

    exim -Mrm your_message_id_to_delete

## Delete/remove messages from queue by sender

Remove all email messages by specific sender address from mail queue

    exiqgrep -i -f sender_email | xargs exim -Mrm

## Delete/remove all messages from queue

    exim -bp | exiqgrep -i | xargs exim -Mrm

## Test address route

    exim -bt your.mail@your.tld

## Test address rewrite rules

    exim -brw your.mail@your.tld

## Find all address

    exigrep [^@]+@[^.]+\.[^.]+ /var/log/exim/exim_main.log

## Show message by id

    exim -Mvl <message_id>

## Show body by id

    exim -Mvb <message_id>

## Retry force

Force queue resend

    exim -qf
