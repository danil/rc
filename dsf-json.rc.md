# JSON

## Pretty print colored

    echo '{"your":"json"} | jq .

## Pretty print stream

Pretty print stream/server output/followed tail
<https://github.com/stedolan/jq/issues/884#issuecomment-338326479>,
<https://github.com/stedolan/jq/issues/477#issuecomment-48632464>

    tail --follow path/to/stream | jq --raw-input --raw-output '. as $line | try fromjson catch $line'

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
