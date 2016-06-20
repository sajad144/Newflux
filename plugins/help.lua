local function run(msg, matches)
  if is_chat_msg(msg) then
    local text = [[
]]
    return text
  end
  if is_channel_msg(msg) then
    local text =[[
👁‍🗨 - Commands for promote :

💭 - /upman : رفع اداري #للمطور
💭 - /inman : ازاله اداري #للمطور
💭 - /add : تعيين مشرف
💭 - /rem : ازاله مشرف
💭 - /list : قائمه المشرفين 

➕

👁‍🗨 - Commands for control member :

💭 - /kick : طرد عبر يوزر او رد
💭 - /ban : حضر عبر يوزر او رد
💭 - /unban : فك حضر عبر يوزر او رد
💭 - /kickme : للخروج من المجموعه
💭 - /silent : لكتم المستخدم
💭 - /unsilent : لالغاء الكتم
💭 - /dl : لمسح الرسالة بلرد

➕

👁‍🗨 - Commands for id and link :

💭 - /in : لعرض الايدي بلرد
💭 - /id : لمعرفه الايدي
💭 - /info : لعرض معلومات المستخدم العاديه
💭 - /glink : لانشاء رابط #يصل_للخاص
💭 - /link : لعرض الرابط
💭 - /clink : لغلق الرابط
💭 - /tagall {msg} : تاك للجميع

➕

👁‍🗨 - Commands for control :

💭 - /rules : القوانين
💭 - /setrules : لانشاء قوانينن
💭 - /block : لحضر كلمات معينة
💭 - /unblock : لفك حضر الكلمات
💭 - /forward : منع اعاده التوجيه
💭 - /unforward : الغاء منع اعاده التوجيه

➕

👁‍🗨 - Commands for Security :

💭 - /close|open link : منع اعلانات
💭 - /close|open image : منع صور
💭 - /close|open sticker : منع ملصقات
💭 - /close|open file  : منع ملفات
💭 - /close|open chat : قفل المحادثه
💭 - /close|open bot : منع بوتات

➕

👁‍🗨 - Info :

💫 - BOT-NET V.2
💫 - About the bot Send - /dev
]]
    return text
  else
    local text = [[aaa]]
    --return text
  end
end

return {
  description = " ", 
  usage = {
    "!help: Show list of plugins.",
  },
  patterns = {
    "^/(help me)$",
  }, 
  run = run,
}
