# Load average rc

    cat /proc/loadavg | cut -d ' ' -f1 | tr -d '\n'
