# [jq][] Command-line JSON processor rcc

[jq]: https://github.com/jqlang/jq

* HOWTO Get value  VER2 `jq . < path/to/file.json`
* HOWTO Get value  VER1 `cat path/to/file.json | jq .`
* HOWTO Get value without quote `jq -r --raw-output .` <sup><sub>Remove double-quotes `"`</sub></sup>
* HOWTO Query root property `jq .` <sup><sub>Pretty print.</sub></sup>
* HOWTO Query property `jq .yourProp`
* HOWTO Select first item `jq .[0]`
* HOWTO List object properties `echo '{"foo":1,"bar":2}' | jq --raw-output '. | keys[]'` <sup><sub>List object keys.</sub></sup>
* HOWTO Keep one array property `jq '.yourArray[].yourProp'`
* HOWTO Delete/remove one array property `jq 'del(.yourArray[].yourProp)'`

## HOWTO Filter array <sup><sub>Count objects in array/size/length. [3279142546][] [2395198962][]</sub></sup>

    jq 'map(select(.yourProp == "Foo")) | length'
    jq '[ .[] | select(.yourProp == "Bar") ] | length'

[3279142546]: https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq#26701851
[2395198962]: https://stackoverflow.com/questions/38121740/how-to-filter-array-of-objects-by-element-property-values-using-jq#38126806

## HOWTO Filter array by type string then by substring then by regexp

    cat path/to/file.json | \
      jq 'map(select(.yourProp2 == 89 and (.yourProp | type) == "string"))' | \
      jq 'map(select(.yourProp | match("foo";"i")))' | \
      jq 'map(select(.yourProp | test(".*bar")))'

## HOWTO Get property from array

    jq -r '
      .[]
      | .code as $code
      | .files[]
      | select(.fileType == "video")
      | "\($code), \"\(.url)\""
    '
