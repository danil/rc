# RubyGems

<http://rubygems.org/>

## Install

    gem uninstall your_gem_name -v '>= 1.2.3'

## Uninstall

    gem uninstall your_gem_name -v '<= 1.2.3'

### Local source

    ruby ./rubygems-1.3.0/setup.rb

## Commands

    gem install rails -s http://gems.rubyonrails.org

## Uninstall all installed gems unless rake

    gem list | cut -d" " -f1 \
        | egrep --invert-match "rake|bundler" | xargs gem uninstall -aIx
