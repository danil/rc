# Non [PCRE][] [regexp][] [sed][] Stream Editor rc

[sed]: https://github.com/mirror/sed
[pcre]: https://github.com/pcre2project/pcre2
[regexp]: https://en.wikipedia.org/wiki/Regular_expression

    find ./ -type f -iregex ".*e?rb" -exec sed -i -r \
         --expression='s|http://tinyerp\.(org\|com)(/edoc)?/?|./|g' '{}' \;
    echo 'Hello, World!' | sed --expression=s/World/work/
    svn status | grep '^[I?]' | sed 's/^[I?]//' | xargs rm -rf

## Inplace replacement

    sed -i --in-place 's/your_old_string/your_new_string/g' path/to/file

## Remove the 42nd line

    sed -i --in-place '42d' ~/.ssh/known_hosts

## Remove 3-7 lines

    sed '3,7d' path/to/in/file > path/to/out/file

## Cut from starting to ending line-numbers

<http://stackoverflow.com/questions/5683367/how-to-cropcut-text-files-based-on-starting-and-ending-line-numbers-in-cygwin#5683408>

    sed -n '134650000,134900000p' production.log > production-2013-02-18.log

## Add \n at end of file

Adds `\n` at the end of the file only if it doesn’t already end with a newline
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#31955>,
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#comment-43399>.

    sed -i --in-place --expression='$a\' ~/.dmenu_history

## Print only matching text

    sed -n --quiet 's/.*skip.*befor\(match.*text\)skip.*after.*/\1/p'

## Placeholders/variables

    sed -e 's/\(unchangeable str\)str to replace/\1new str/g' path/to/file

## tr converts uppercase to lowercase

<http://cyberciti.biz/faq/linux-unix-shell-programming-converting-lowercase-uppercase>

    tr '[:upper:]' '[:lower:]' < input.txt > output.txt

## tr replaces returns with space

    cat ./file | tr '\n' ' '

## Config dryup

    cat /etc/ntp.conf | grep -v '^#' | grep -v '^$'
