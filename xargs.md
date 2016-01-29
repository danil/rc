xargs
=====

Files content
-------------

### By last modify

<http://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified#546900>

    find . -name *.ebuild -printf "%T@ %Tc %p\n" \
      | sort -n \
      | sed -e 's|^[^\/]* ||' \
      | xargs -I % sh -c 'echo -e "\n\n########### %\n" && cat %' \
      | less

### Other

    ack -a -g . | xargs -I % sh -c 'echo -e "\n\n########### %\n" && cat %' | less
