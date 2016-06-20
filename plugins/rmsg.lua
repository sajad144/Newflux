local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'" Msg Is Removed', ok_cb, false)
  else
    send_msg(extra.chatid, 'Massages Has Been Removed', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'rmsg' and is_sudo(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 10000 or tonumber(matches[2]) < 1 then
        return "Only Remove +5 Massages"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "Only Work In SuperGroup"
    end
  else
    return "You Are Not Admin"
  end
end

return {
    patterns = {
        '^[!/#](rmsg) (%d*)$'
    },
    run = run
}
