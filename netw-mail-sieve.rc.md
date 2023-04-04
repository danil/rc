# Sieve

## Match addresses by domain

<https://tty1.net/blog/2011/sieve-tutorial_en.html#addresspart>

    if address :is :domain "to" "your.tld"
    {
        fileinto "yourdir";
    }

or equivalent to

    if address :matches :all "to" "*@your.tld"
    {
        fileinto "yourdir";
    }

## Testing

<http://fastmail.com/cgi-bin/sievetest.pl>

Test the syntax of sieve-scripts

    require ["fileinto"];
    if allof (address :all :is "to" "user@your.tld",
                   header :matches "X-Attached" ["*.docm", "*.zip"]) {
      fileinto "INBOX.Junk Mail";
    }
