# logrotate

## Run

https://wiki.archlinux.org/title/logrotate#Usage

    logrotate --verbose /etc/logrotate.conf

## Run single

    logrotate /etc/logrotate.d/your_log

## Test all configs

https://wiki.archlinux.org/title/logrotate#Configuration

    logrotate --debug /etc/logrotate.conf

## Test single config

    logrotate --debug /etc/logrotate.d/your_log
