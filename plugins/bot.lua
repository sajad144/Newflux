local function isBotAllowed (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  local banned = redis:get(hash)
  return banned
end

local function allowBot (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  redis:set(hash, true)
end

local function disallowBot (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  redis:del(hash)
end

-- Is anti-bot enabled on chat
local function isAntiBotEnabled (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  local enabled = redis:get(hash)
  return enabled
end

local function enableAntiBot (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  redis:set(hash, true)
end

local function disableAntiBot (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  redis:del(hash)
end

local function isABot (user)
  -- Flag its a bot 0001000000000000
  local binFlagIsBot = 4096
  local result = bit32.band(user.flags, binFlagIsBot)
  return result == binFlagIsBot
end

local function isABotBadWay (user)
  local username = user.username or ''
  return username:match("[Bb]ot$")
end

local function kickUser(userId, chatId)
  local chat = 'chat#id'..chatId
  local user = 'user#id'..userId
  chat_del_user(chat, user, function (data, success, result)
    if success ~= 1 then
      print('I can\'t kick '..data.user..' but should be kicked')
    end
  end, {chat=chat, user=user})
end

local function run (msg, matches)

  -- We wont return text if is a service msg
  if matches[1] ~= 'chat_add_user' and matches[1] ~= 'chat_add_user_link' then
    if msg.to.type ~= 'chat' and msg.to.type ~= 'channel' then
      return 'Lock Bot Is Open On Channel'
    end
  end

  local chatId = msg.to.id
  if matches[1] == 'close' then
    enableAntiBot(chatId)
    return 'It was to prevent bots'
  end
  if matches[1] == 'open' then
    disableAntiBot(chatId)
    return 'It was allowed to bots'
  end
  if matches[1] == 'open' then
    local userId = matches[2]
    allowBot(userId, chatId)
    return 'Bot '..userId..' Allowed'
  end
  if matches[1] == 'close' then
    local userId = matches[2]
    disallowBot(userId, chatId)
    return 'Bot '..userId..' DisAllowed'
  end
  if matches[1] == 'chat_add_user' or matches[1] == 'chat_add_user_link' then
    local user = msg.action.user or msg.from
    if isABotBadWay(user) then
      print('It Is Bot')
      if isAntiBotEnabled(chatId) then
        print('Lock Bot Is Install')
        local userId = user.id
        if not isBotAllowed(userId, chatId) then
          kickUser("user#id"..userId, "channel#id"..chatId)
         --chat_del_user(userId, chatId)
          channel_kick_user("channel#id"..msg.to.id, 'user#id'..userId, ok_cb, false)
          return "Bot Is DisAllowed"
        else
          print('This Bot Is Allowed')
        end
      end
    end
  end
end

return {
  description = 'When bot enters group kick it.',
  usage = {
  },
  patterns = {
    '^[#!/](open@) [Bb][Oo][Tt] (%d+)$',
    '^[#!/](close@) [Bb][Oo][Tt] (%d+)$',
    '^[#!/](close) [Bb][Oo][Tt]$',
    '^[#!/](open) [Bb][Oo][Tt]$',
    '^!!tgservice (chat_add_user)$',
    '^!!tgservice (chat_add_user_link)$'
  },
  run = run
}
