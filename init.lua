
local names = {
  justnow = "nu net",
  minute = {
    singular = "min",
    plural = "min"
  },
  hour = {
    singular = "uur",
    plural = "uur"
  },
  day = {
    singular = "dag",
    plural = "dagen"
  },
  week = {
    singular = "week",
    plural = "weken"
  },
  month = {
    singular = "maand",
    plural = "maanden"
  },
  year = {
    singular = "jaar",
    plural = "jaar"
  }
}
local function timeago (time)
  local span = date.diff(date(), time)

  local num = span:spanseconds()
  if num < 45 then return names.justnow end

  num = span:spanminutes()
  if num < 1.5 then return "1 " .. names.minute.singular end
  if num < 59.5 then return math.round(num) .. " " .. names.minute.plural end

  num = span:spanhours()
  if num < 1.5 then return "1 " .. names.hour.singular end
  if num < 23.5 then return math.round(num) .. " " .. names.hour.plural end

  num = span:spandays()
  if num < 1.5 then return "1 " .. names.day.singular end
  if num < 7.5 then return math.round(num) .. " " .. names.day.plural end

  if num / 7 < 1.5 then return "1 " .. names.week.singular end
  if num / 7 < 4.5 then return math.round(num / 7) .. " " .. names.week.plural end

  if num / 30 < 1.5 then return "1 " .. names.month.singular end
  if num / 30 < 11.5 then return math.round(num / 30) .. " " .. names.month.plural end

  if num / 365.25 < 1.5 then return "1 " .. names.year.singular end
  return math.floor(num / 365.25) .. " " .. names.year.plural
end
print("2013-06-20T10:32+02:00", timeago("2013-06-20T10:32+02:00"))
print("2013-06-19T10:32+02:00", timeago("2013-06-19T10:32+02:00"))
print("2013-06-18T10:32+02:00", timeago("2013-06-18T10:32+02:00"))
print("2013-06-17T10:32+02:00", timeago("2013-06-17T10:32+02:00"))
print("2013-06-16T10:32+02:00", timeago("2013-06-16T10:32+02:00"))
print("2013-06-15T10:32+02:00", timeago("2013-06-15T10:32+02:00"))
print("2013-06-14T10:32+02:00", timeago("2013-06-14T10:32+02:00"))
print("2013-06-13T10:32+02:00", timeago("2013-06-13T10:32+02:00"))
print("2013-06-12T10:32+02:00", timeago("2013-06-12T10:32+02:00"))
print("2013-06-07T10:32+02:00", timeago("2013-06-07T10:32+02:00"))
print("2013-06-01T10:32+02:00", timeago("2013-06-01T10:32+02:00"))
print("2013-05-15T10:32+02:00", timeago("2013-05-15T10:32+02:00"))
print("2012-07-20T10:32+02:00", timeago("2012-07-20T10:32+02:00"))
print("2011-07-20T10:32+02:00", timeago("2011-07-20T10:32+02:00"))
print("1971-07-20T10:32+02:00", timeago("1971-07-20T10:32+02:00"))
