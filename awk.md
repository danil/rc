# AWK

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
