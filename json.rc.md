# JSON

## Pretty print colored

    echo '{"your":"json"} | jq .

## Pretty print without colors

    echo '{"your":"json"} | python -m json.tool

## Generate

<https://github.com/webroo/dummy-json>

    t=$(mktemp /tmp/XXX.json) echo '{"id": "{{guid}}"}' > $t \
      && `npm bin`/dummyjson $t && rm $t

## Validate

<http://trentm.com/json/#FEATURE-Validation>

    cat path/to/file.json | `npm bin`/json --validate

## Query gron

Greppable JSON <https://github.com/tomnomnom/gron>

    gron "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" \
      | fgrep "commit.author"

## Query jq

Command-line JSON processor <http://stedolan.github.io/jq>

## Query jq select first item

    cat path/to/file.json | jq .[0]

## Query jq filter array

Filter and count objects in array
<https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq#26701851>
<https://stackoverflow.com/questions/38121740/how-to-filter-array-of-objects-by-element-property-values-using-jq#38126806>:

    cat path/to/file.json | jq 'map(select(.yourProperty == "Foo")) | length'
    cat path/to/file.json | jq '[ .[] | select(.yourProperty == "Bar") ] | length'

## Query jq filter array by type string then by substring then by regexp

    cat path/to/file.json | \
      jq 'map(select(.yourId == 89 and (.yourValue | type) == "string"))' | \
      jq 'map(select(.value | match("foo";"i")))' | \
      jq 'map(select(.value | test(".*bar")))'
