# jq json rcc

Command-line JSON processor <http://stedolan.github.io/jq>

    cat path/to/file.json | jq .

## jq query root property

    jq .

## jq query property

    jq .yourProp

## jq select first item

    jq .[0]

## jq filter array

Filter and count objects in array
<https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq#26701851>
<https://stackoverflow.com/questions/38121740/how-to-filter-array-of-objects-by-element-property-values-using-jq#38126806>:

    jq 'map(select(.yourProp == "Foo")) | length'
    jq '[ .[] | select(.yourProp == "Bar") ] | length'

## jq filter array by type string then by substring then by regexp

    cat path/to/file.json | \
      jq 'map(select(.yourId == 89 and (.yourVal | type) == "string"))' | \
      jq 'map(select(.value | match("foo";"i")))' | \
      jq 'map(select(.value | test(".*bar")))'

## jq keep one array property

    jq '.yourArray[].yourProp'

## jq delete/remove one array property

    jq 'del(.yourArray[].yourProp)'

## jq get property from array

    jq -r '
      .[]
      | .code as $code
      | .files[]
      | select(.fileType == "video")
      | "\($code), \"\(.url)\""
    '
