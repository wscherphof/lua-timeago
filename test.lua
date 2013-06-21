require("node_modules.lua-loader.init")(function() end)
local timeago = require("init")

assert(timeago.parse() == "just now")
assert(timeago.parse("2011-06-21") == "2 years")
timeago.setlanguage("nederlands")
assert(timeago.parse() == "zojuist")
assert(timeago.parse("2011-06-21") == "2 jaar")
