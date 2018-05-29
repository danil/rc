# Mail

## Send

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

```sh
echo "Your mail body" | mail --subject="Your subject" your.name@example.org
echo -e "Subject: Your subject\n\n Your mail body\n" \
    | sendmail your.name@domain.com
```

### HTML

```sh
mail --append="Content-type: text/html;" \
     --subject="Your subject" \
     your.name@example.org < path/to/index.html
```

## Mailserver version

    /usr/sbin/sendmail -bV
    exim -bV

## SMTP

### swaks

`net-mail/swaks` command line smtp testing, including tls and auth
<http://jetmore.org/john/code/swaks/>

    swaks --auth \
          --server your.smtp.domain \
          --auth-user your-login \
          --auth-password your-password \
          --to your.name@example.org \
          --h-Subject: "Your subject" \
          --body "Your mail body"

## Mailgun

```sh
curl -s --user 'api:YOUR_API_KEY' \
    https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages \
    -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
    -F to=YOU@YOUR_DOMAIN_NAME \
    -F to=bar@example.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomeness!'
```
