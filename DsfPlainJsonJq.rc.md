# [jq][] JSON rcc <sup><sub>Command-line JSON processor</sub></sup>

[jq]: https://github.com/jqlang/jq

    cat path/to/file.json | jq .

## HOWTO Query root property

    jq .

## HOWTO Query property

    jq .yourProp

## HOWTO Select first item

    jq .[0]

## HOWTO Filter array

Filter and count objects in array
<https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq#26701851>
<https://stackoverflow.com/questions/38121740/how-to-filter-array-of-objects-by-element-property-values-using-jq#38126806>:

    jq 'map(select(.yourProp == "Foo")) | length'
    jq '[ .[] | select(.yourProp == "Bar") ] | length'

## HOWTO Filter array by type string then by substring then by regexp

    cat path/to/file.json | \
      jq 'map(select(.yourId == 89 and (.yourVal | type) == "string"))' | \
      jq 'map(select(.value | match("foo";"i")))' | \
      jq 'map(select(.value | test(".*bar")))'

## HOWTO Keep one array property

    jq '.yourArray[].yourProp'

## HOWTO Delete/remove one array property

    jq 'del(.yourArray[].yourProp)'

## HOWTO Get property from array

    jq -r '
      .[]
      | .code as $code
      | .files[]
      | select(.fileType == "video")
      | "\($code), \"\(.url)\""
    '
