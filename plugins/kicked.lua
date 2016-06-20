do
--Create and Coded by Sajad Aliraqe - @SasO_0
  local function action_by_reply(extra, success, result)
    if result.from.username then
      user_name = '@'..result.from.username
    else
      user_name = ''
    end
    local text = result.from.peer_id
  channel_kick_user("channel#id"..result.to.peer_id, 'user#id'..result.from.peer_id, ok_cb, false)
  end

  local function run(msg, matches)
      if not is_momod(msg) then
          return nil
      end
    if matches[1]:lower() == 'kick' and msg.reply_id then
      get_message(msg.reply_id, action_by_reply , {receiver=get_receiver(msg)})

    end
  end
--Create and Coded by Sajad Aliraqe - @SasO_0
  return {
    decription = 'test kick by_reply',
    usage = 'reply then type kick',
    patterns = {
      '^[/!#](kick)$',
    },
    run = run
  }

end
