# sed

Stream Editor

    find ./ -type f -iregex ".*e?rb" -exec sed -i -r \
         --expression='s|http://tinyerp\.(org\|com)(/edoc)?/?|./|g' '{}' \;
    echo 'Hello, World!' | sed --expression=s/World/work/
    svn status |grep '^[I?]' |sed 's/^[I?]//' |xargs rm -rf

## Remove the 7rd line

    sed --in-place '7d' ~/.ssh/known_hosts

## Cut from starting to ending line-numbers

<http://stackoverflow.com/questions/5683367/how-to-cropcut-text-files-based-on-starting-and-ending-line-numbers-in-cygwin#5683408>

    sed -n '134650000,134900000p' production.log > production-2013-02-18.log

## Add \n at end of file

Adds `\n` at the end of the file only if it doesn’t already end with a newline
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#31955>,
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#comment-43399>.

sed --in-place --expression='$a\' ~/.dmenu_history

# AWK

    awk '{ FS = "\t" ; OFS = "\t" ; print $1,"ru",$2,$3 }' \
        infile > outfile
    awk '{ FS = "\t" ; OFS = "\t" ; if ( NR > 1 ) print $1,$3 }' \
        infile > outfile

# tr

## Convert uppercase to lowercase

<http://cyberciti.biz/faq/linux-unix-shell-programming-converting-lowercase-uppercase>

    tr '[:upper:]' '[:lower:]' < input.txt > output.txt

## Replacing returns with space

    cat ./file | tr '\n' ' '

## Config dryup

    cat /etc/ntp.conf | grep -v '^#' | grep -v '^$'
