local filename='data/creategroup.lua'
local cronned = load_from_file(filename)

local function save_cron(msg,text,date)
  if msg.from.username then
      username = msg.from.username
  else
      username = msg.from.print_name
  end
  local user_id = tostring(msg.from.id)
  if not cronned[date] then
    cronned[date] = {}
  end
  local arr = { user_id, username, text } ;
  table.insert(cronned[date], arr)
  serialize_to_file(cronned, filename)
  return 'Saved!'
end

local function delete_cron(date)
  for k,v in pairs(cronned) do
    if k == date then
	  cronned[k]=nil
    end
  end
  serialize_to_file(cronned, filename)
end

local function cron()
  for date, values in pairs(cronned) do
  	if date < os.time() then --time's up
	  	local user_id = values[1][1]
	  	create_group_chat ("user#id"..user_id, values[1][3], ok_cb, false)
	  	send_large_msg("user#id"..user_id, "Group \""..values[1][3].."\" has been created!")
  		delete_cron(date) --TODO: Maybe check for something else? Like user
  		-- delete from redis
  		local hash =  'waiting:'..user_id
        redis:del(hash)
	end

  end
end

local function is_pending(user_id)
  local hash =  'waiting:'..user_id
  local wait = redis:get(hash)
  return wait or false
end

local function actually_run(msg, delay,text)
  save_cron(msg,text,delay)
  local hash =  'waiting:'..msg.from.id
  redis:set(hash, true)
  return "Please wait, group '"..text.."' will be created shortly"
end

local function run(msg, matches)
  local wait = 3 -- waiting time (in minute) #you can change the value as you want#
  --[[if is_chat_msg(msg) then
      --return 'Only works on private message!'
  end]]
  if matches[1] == 'mkg' and matches[2] then
      if is_admin(msg) then
          local group_name = matches[2]
          local group_creator = msg.from.print_name
          create_group_chat (group_creator, group_name, ok_cb, false)
          return ' '..string.gsub(group_name, '_', ' ')..'Group successfully been making ☑️'
      --[[else
          local pending = is_pending(msg.from.id)
          if pending then
              return 'Your another request still on progress, please wait.'
          end
          local wait = wait*60
          local date = wait+os.time()
          local text = matches[2]
          local text = actually_run(msg, date, text)
          return text]]
      end
  end
end

return {
  description = "Plugin to create a new group",
  usage = {
  	"/mkg <group_name> : Create a new moderation group",
  },
  patterns = {
    "^/(mkg) (.*)$",
  }, 
  run = run,
  hidden = true,
  --cron = cron
}
