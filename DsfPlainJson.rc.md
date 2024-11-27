# JSON

* HOWTO Pretty print `echo '{"your":"json"} | jq --raw-input --raw-output '. as $line | try fromjson catch $line'` <sup><sub>Pretty print colored with error handling.</sub></sup>
* HOWTO Pretty print stream `tail --follow path/to/stream | jq --raw-input --raw-output '. as $line | try fromjson catch $line'` <sup><sub>Pretty print stream/server output/followed tail colored with error handling. [265052512][] [466031659][]</sub></sup>
* HOWTO Pretty print `echo '{"your":"json"} | python -m json.tool` <sup><sub>Pretty print without color and without error handling.</sub></sup>
* HOWTO Generate `t=$(mktemp /tmp/XXX.json) echo '{"id": "{{guid}}"}' > $t && npx bin dummyjson $t && rm $t` <sup><sub>[1059349458][]</sub></sup>
* HOWTO Validate `cat path/to/file.json | npx json --validate` <sup><sub>[2080383538][]</sub></sup>
* HOWTO Query gron `gron "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" | fgrep "commit.author"` <sup><sub>Greppable JSON. [3590563591][]</sub></sup>

[1059349458]: https://github.com/webroo/dummy-json
[2080383538]: http://trentm.com/json/#FEATURE-Validation
[265052512]: https://github.com/stedolan/jq/issues/884#issuecomment-338326479
[3590563591]: https://github.com/tomnomnom/gron
[466031659]: https://github.com/stedolan/jq/issues/477#issuecomment-48632464
