# JSON

# json

## Validation

<http://trentm.com/json/#FEATURE-Validation>

    cat path/to/file.json | `npm bin`/json --validate

# jq

Command-line JSON processor <http://stedolan.github.io/jq>

## Select first item

    cat path/to/file.json | jq .[0]
