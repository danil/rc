# Mail rcc

## Send

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

    echo -e "Subject: Your subject\n\nYour mail body\n" \
         | /usr/sbin/sendmail your.nm@your.tld

    echo -e "Your body" | mail --subject="Your subject" your.nm@your.tld

    printf %b "From: your.nm+1@your.tld\nTo: your.nm+2@your.tld\nSubject: Your subject\n\nYour body" | \
           /usr/sbin/sendmail -f "your.nm+1@your.tld" "your.nm+2@your.tld"

## Send HTML

Mail with HTML body

```sh
mail --append="Content-type: text/html;" \
     --subject="Your subject" \
     your.nm@your.tld < path/to/index.html
```

## Send by SMTP through TELNET

```sh
telnet localhost smtp
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
220 your.tld ESMTP Exim 4.90_1 Tue, 29 May 2018 07:27:36 +0000
HELO localhost
250 your.tld Hello localhost [127.0.0.1]
mail from: your.nm@your.tld
250 OK
rcpt to: your.nm@your.tld
250 Accepted
data
354 Enter message, ending with "." on a line by itself
Subject: Your subject

Your mail body
.
250 OK id=1fNZ3C-0001X2-6P
quit
221 your.tld closing connection
Connection closed by foreign host.
```

## Mailserver version

    /usr/sbin/sendmail -bV
    exim -bV

## SMTP Swaks

`net-mail/swaks` command line smtp testing, including tls and auth
<http://jetmore.org/john/code/swaks/>

    swaks --auth \
          --server your.smtp.domain \
          --auth-user your-login \
          --auth-password your-password \
          --to your.nm@your.tld \
          --h-Subject: "Your subject" \
          --body "Your mail body"

## [Mailgun][] [MTA][]

```sh
curl -s --user 'api:YOUR_API_KEY' \
    https://api.mailgun.net/v3/YOUR_DOMAIN_NM/messages \
    -F from='Excited User <mailgun@YOUR_DOMAIN_NM>' \
    -F to=YOU@YOUR_DOMAIN_NM \
    -F to=bar@your.tld \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomeness!'
```

[mailgun]: https://mailgun.com
[mta]: https://en.wikipedia.org/wiki/Message_transfer_agent
