# RubyGems

<http://rubygems.org/>

## Installation

    ruby ./rubygems-1.3.0/setup.rb --no-rdoc --no-ri

## Commands

    gem install --include-dependencies --no-rdoc --no-ri rails
    gem install rails -s http://gems.rubyonrails.org

## Uninstall all installed gems unless rake

    gem list | cut -d" " -f1 \
      | egrep --invert-match "rake|bundler" | xargs gem uninstall -aIx
