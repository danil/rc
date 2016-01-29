# cron

## Test jobs

<http://stackoverflow.com/questions/4984725/how-to-test-cron-job#18878111>

    sudo run-parts /etc/cron.hourly


## Simulate environment

Simulate the environment cron executes a script with
<http://stackoverflow.com/questions/2135478/how-to-simulate-the-environment-cron-executes-a-script-with#2546509>

Redirect `env` output from cron to file

    */2 * * * * env > path/to/cronenv

Then run shell with environment variabes

    env - `cat path/to/cronenv` /bin/sh
