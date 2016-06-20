
local function run(msg, matches)
--create by RoyalTeam ID CHANNEL : @RoyalTeamCh
   if msg.to.type == 'chat' and is_momod then
chat_upgrade('chat#id'..msg.to.id, ok_cb, false)
     return "Chat Upgraded to SuperGroups"
   end
end
 --create by RoyalTeam ID CHANNEL : @RoyalTeamCh
 return {
   patterns = {
"^[!/#](tosuper)$",
  }, 
   run = run 
 }
