# swaks

Command line smtp testing, including tls and auth
<http://jetmore.org/john/code/swaks/>

    swaks --auth \
          --server your.smtp.domain \
          --auth-user your-login \
          --auth-password your-password \
          --to your@mail.address \
          --h-Subject: "Hello" \
          --body 'World'
