Lua
===

    lua -lluarocks.require
    require "luarocks.require"

Pretty print/debugging
----------------------

<https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console#9168316>

```lua
local pp = require 'pl.pretty'
local t = { a = { b = { c = 'Hello world!', 1 }, 2, d = { 3 } } }
pp.dump(t)
```

String
------

String literals
<https://stackoverflow.com/questions/17202195/difference-between-and-within-lua#17202311>

```lua
-- Double quotes enclosed in single quotes.
s = 'My friend said: "Hi!!"'

-- Single quotes enclosed in double quotes.
s = "My friend said: 'Hi!!'"

-- Single and double quotes enclosed in double brackets.
s = [[My friend said: "What's up?"]]
```

[Date with time zone][]
-----------------------

* [Discussion](http://lua-users.org/lists/lua-l/2008-03/msg00050.html)
* [Wiki page][Date with time zone]
* Also [Date rock](http://luarocks.org/repositories/rocks/#date) available

[Date with time zone]: http://lua-users.org/wiki/TimeZone

LuaRocks search
---------------

    luarocks search your_rock

LuaRocks lists installed
------------------------

    luarocks list your_rock

LuaRocks install
----------------

    luarocks install your_rock

LuaRocks install local
----------------------

    luarocks install --local your_rock

LuaRocks install
----------------

    luarocks remove your_rock
