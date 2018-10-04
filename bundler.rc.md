# Bundler

## Skip environments

    bundle install --without=production:test

## Config

Configuration file `~/.bundle/config`

### Use multiple cpu cores

Use 1 less than the number of cores machine has.

    bundle config --global jobs $((`nproc` - 1))
