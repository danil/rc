# Sieve

## Test

<http://fastmail.com/cgi-bin/sievetest.pl>

Test the syntax of sieve-scripts

```sieve
require ["fileinto"];
if allof (address :all :is "to" "user@example.org",
               header :matches "X-Attached" ["*.docm", "*.zip"]) {
  fileinto "INBOX.Junk Mail";
}
```
