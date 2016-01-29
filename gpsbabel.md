GPSBabel
========

Reduce track points
-------------------

<http://gpsbabel.org/htmldoc-development/filter_simplify.html>

    gpsbabel -r \
             -i gpx \
             -f infile.gpx \
             -x simplify,count=250 \
             -o garmin \
             -F outfile.gpx
