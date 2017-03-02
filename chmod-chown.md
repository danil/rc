# chmod

    chmod -R ug+w ./smarty/templates_c/ ./smarty/cach/

## Fix files and directories permissions

<http://superuser.com/questions/126073/chmod-to-allow-read-and-write-permissions-for-directory#126075>

    find ./somedir \( -type d -exec chmod u=rwx,g=rx,o=xr {} \; \
                   -o -type f -exec chmod u=rw,g=r,o=r {} \; \)

# chown

    chown --recursive www-data:www-data ./smarty/templates_c/ ./smarty/cache/
