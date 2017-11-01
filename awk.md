# AWK

## Remove first lines from output

Omitting the first two lines from output

    echo -e "a\nb\nc" | awk '{if(NR>2)print}'

## Other

    awk '{ FS = "\t" ; OFS = "\t" ; print $1,"ru",$2,$3 }' \
        infile > outfile
    awk '{ FS = "\t" ; OFS = "\t" ; if ( NR > 1 ) print $1,$3 }' \
        infile > outfile

    function to_mysql_data(data) {
        return gensub(/([0-9]+)\.([0-9]+)\.([0-9]+)/, "\\3-\\2-\\1", "g", data)
    }
    {
        FS = "|"
        OFS = "|"
        $21 = to_mysql_data($21)
        $22 = to_mysql_data($22)
        $23 = to_mysql_data($23)
        if ( NR > 1 ) print
    }
