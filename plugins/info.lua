--Coded By Sajad Aliraqe >> @SasO_0
do
function run(msg, matches)
local reply_id = msg['id']
local text = 'info'
local text1 =" - Group ID : "..msg.to.id.."\n - Group name : "..msg.to.title.."\n - Your name : "..(msg.from.first_name or '').."\n - First : "..(msg.from.first_name or '').."\n - Last : "..(msg.from.last_name or '').."\n - User ID : "..msg.from.id.."\n - Username : @"..(msg.from.username or '').."\n - Phone number : +"..(msg.from.phone or '').."\n - Receives : 5 K."
  reply_msg(reply_id, text1, ok_cb, false)
end
return {
  description = "", 
  usage = "",
  patterns = {
    "^[!/#]info$",
  },
  run = run
}
end

--Coded By Sajad Aliraqe >> @SasO_0
