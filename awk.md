<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

AWK
====

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
