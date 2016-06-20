local function get_msg_callback(extra, success, result)
  --vardump(extra)
  --vardump(success)
  vardump(result)
  local get_cmd = extra.get_cmd
  local receiver = extra.receiver
end

local function resuser(extra, success, result)
  local receiver = extra.receiver
  local username = extra.username
  if success == 1 then
  	vardump(result)
  	send_large_msg(receiver, result.peer_id)
  else
  	send_large_msg(receiver, "User not found!")
  end
end

local function generate_link(cb_extra, success, result)
  local receiver = cb_extra.receiver
  if success == 0 then
    return send_large_msg(receiver, "Can't generate invite link for this group")
  end
  vardump(result)
	return send_large_msg(receiver,' ➡️ '..result)
end

local function pre_process(msg)
  vardump(msg)
  return msg
end

local function run(msg, matches)
  local get_cmd = matches[1]
  local receiver = get_receiver(msg)
  if matches[1] == 'clink' and msg.reply_id then
    delete_msg(msg.reply_id, ok_cb, false)
end
  if msg.text == "/clink" then
	return "Link successfully closed"
end

  if matches[1] == 'rlink' then
    local username = 'silenceangel'
    resolve_username(username, resuser, {receiver=get_receiver(msg), username=username})
  end
  if matches[1] == 'link' then
    if is_chat_msg(msg) then
      export_chat_link(receiver, generate_link, {receiver=receiver})
    end
    if is_channel_msg(msg) then
      export_channel_link(receiver, generate_link, {receiver=receiver})
    end
  end
  if msg.reply_id then
    print(msg.reply_id)
    get_message(msg.reply_id, get_msg_callback, {get_cmd=get_cmd, receiver=receiver})
  end
end

return {
  description = " ", 
  usage = {
    
  },
  patterns = {
    "^[!/](debug)$",
    "^/(clink)$",
    "^[!/](@rlink)$",
    "^[!/](link)$",
  }, 
  run = run,
  pre_process = pre_process
}
