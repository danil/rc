# Rubygems

<http://rubygems.org/>

## Install

    gem install your_gem_name -v '>= 1.2.3'

## Install/vendoring

Installing to custom directory

    gem unpack your_gem_name --target path/to/directory

## Uninstall

    gem uninstall your_gem_name -v '<= 1.2.3'

## Uninstall local source

    ruby ./rubygems-1.3.0/setup.rb

## Commands

    gem install rails -s http://gems.rubyonrails.org

## Uninstall all installed gems unless rake

    gem list | cut -d" " -f1 \
        | egrep --invert-match "rake|bundler" | xargs gem uninstall -aIx
