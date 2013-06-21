require("node_modules.lua-loader.init")(function() end)
local date = require("lua-date")

local timeago = {}

local language = require("english")

function timeago.setlanguage (newlanguage)
  if "table" == type(newlanguage) then
    language = newlanguage
  elseif "string" == type(newlanguage) then
    language = require(newlanguage)
  end
  assert(language and language.justnow)
  assert(language.minute and language.minute.singular and language.minute.plural)
  assert(language.hour   and language.hour.singular   and language.hour.plural  )
  assert(language.day    and language.day.singular    and language.day.plural   )
  assert(language.week   and language.week.singular   and language.week.plural  )
  assert(language.month  and language.month.singular  and language.month.plural )
  assert(language.year   and language.year.singular   and language.year.plural  )
end

local function round (num)
  return math.floor(num + .5)
end

function timeago.parse (time)
  local span = date.diff(date(), time or date())

  local num = span:spanseconds()
  if num < 45 then return language.justnow end

  num = span:spanminutes()
  if num < 1.5 then return "1 " .. language.minute.singular end
  if num < 59.5 then return round(num) .. " " .. language.minute.plural end

  num = span:spanhours()
  if num < 1.5 then return "1 " .. language.hour.singular end
  if num < 23.5 then return round(num) .. " " .. language.hour.plural end

  num = span:spandays()
  if num < 1.5 then return "1 " .. language.day.singular end
  if num < 7.5 then return round(num) .. " " .. language.day.plural end

  if num / 7 < 1.5 then return "1 " .. language.week.singular end
  if num / 7 < 4.5 then return round(num / 7) .. " " .. language.week.plural end

  if num / 30 < 1.5 then return "1 " .. language.month.singular end
  if num / 30 < 11.5 then return round(num / 30) .. " " .. language.month.plural end

  if num / 365.25 < 1.5 then return "1 " .. language.year.singular end
  return round(num / 365.25) .. " " .. language.year.plural
end

return timeago
