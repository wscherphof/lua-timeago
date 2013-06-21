# lua-timeago

Turn a timestamp into a friendly string of how long ago it was

## Usage

### 1. Install
Setup [lua-loader](https://github.com/wscherphof/lua-loader) and then just `npm install lua-timeago`

### 2. Require
```lua
local timeago = require("lua-timeago")
```

### 3. Have fun
```lua
assert(timeago.parse() == "just now")
assert(timeago.parse("2011-06-21") == "2 years")
timeago.setlanguage("nederlands")
assert(timeago.parse() == "zojuist")
assert(timeago.parse("2011-06-21") == "2 jaar")
```
You can feed it anything that is swallowed by [lua-date](https://github.com/wscherphof/lua-date): date/time strings in different formats, or a lua-date date object.
The default language is `"english"`, and some other languages are readily available. You can provide a new language by passing a table with all the values (see [english.lua](english.lua)), but if you do that, don't forget to issue a pull request as well.

## License
[GNU Lesser General Public License (LGPL)](http://www.gnu.org/licenses/lgpl-3.0.txt)
