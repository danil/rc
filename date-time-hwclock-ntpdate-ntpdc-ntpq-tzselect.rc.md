# Date and time

## Timestamp

### To time/date

    date --date=@1480865885 --rfc-3339=seconds

### To timestamp

    date +%s --date="1970-01-01T00:00:00+0000"

## Set

    date --set="2008-04-30 08:48:0" # YYYY-mm-dd HH:MM:S (ISO 8601).
    date --set="041501482008" # mmddHHMMYYYY (OpenWRT).

## Hardware clock (RTC)

<http://en.qi-hardware.com/wiki/Ben_NanoNote_TimeZone_Date_and_Calendar_HOWTO>

    hwclock --systohc --localtime

## ntpdate

    ntpdate -u -d 192.168.91.2

## ntpd

    ntpdc -c sysinfo -n # Stratum 3 is good enough.
    ntpq -c readvar
    ntpq -c peers

### Other

    date +%Y%m%d%H%M%S #19700101000000
    date +%z
    date --iso-8601=seconds #2014-08-15T16:40:09+0400
    date --utc +%Y%m%dT%H%M%SZ #19700101T000000Z
    tzselect #show what value to use for TZ environment variable
