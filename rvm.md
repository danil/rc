Ruby Version Manager
====================

Upgrade
-------

    rvm update

Other
-----

    rvm list known
    rvm --force install 1.9.2
    rvm use 1.9.2
    rvm info
    rvm --default use 1.8.7@avers_prohq

Gemset
------

    rvm gemset create gemset_foo
    rvm use 1.8.7@gemset_foo
    rvm gemset list

### Copy

    rvm gemset copy 1.8.7@avers_prohq 1.8.7@avers_prohq_accounting

### Delete

    rvm gemset delete 1.8.7@avers_prohq_accounting
