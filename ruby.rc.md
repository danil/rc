Ruby rc
=======

Activesupport
-------------

<http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html>.

    gem install activesupport

```ruby
require 'active_support/core_ext'
your.presence || variable.present? || name.blank?
```

Activesupport transliteration
-----------------------------

Replaces non-ASCII characters with an ASCII approximation
<http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-transliterate>.

    ActiveSupport::Inflector.transliterate('привет')
