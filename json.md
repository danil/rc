# JSON

## Generate

<https://github.com/webroo/dummy-json>

    t=$(mktemp /tmp/XXX.json) echo '{"id": "{{guid}}"}' > $t \
      && `npm bin`/dummyjson $t && rm $t

## Validate

<http://trentm.com/json/#FEATURE-Validation>

    cat path/to/file.json | `npm bin`/json --validate

## Query

### gron

Greppable JSON <https://github.com/tomnomnom/gron>

    gron "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" \
      | fgrep "commit.author"

### jq

Command-line JSON processor <http://stedolan.github.io/jq>

#### Select first item

    cat path/to/file.json | jq .[0]
